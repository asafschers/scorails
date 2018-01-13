class ScoresController < ActionController::Base

  def index
    random_forest = Scoruby.load_model 'app/pmmls/titanic_rf.pmml'

    @categorical_options = random_forest.categorical_features
    @categorical_values = @categorical_options.transform_values{|v| v.first}
    @continuous_features = (Hash[random_forest.continuous_features.product([3])])
  end

  def score
    random_forest = Scoruby.load_model 'app/pmmls/titanic_rf.pmml'

    @continuous_features = random_forest.continuous_features.each_with_object({}) do |feature, hash|
      hash[feature] = params[feature].to_f
    end

    @categorical_options = random_forest.categorical_features
    @categorical_values = random_forest.categorical_features.keys.each_with_object({}) do |feature, hash|
      hash[feature] = params[feature]
    end

    begin
      @score = random_forest.predict(@continuous_features.merge(@categorical_values))
    rescue => e
      @score = e
    end

    respond_to do |format|
      format.html { render 'scores/index' }
    end
  end
end