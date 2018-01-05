class ScoresController < ActionController::Base

  def index
    random_forest = Scoruby.load_model 'app/pmmls/titanic_rf.pmml'
    @features =  {
      Sex: 'male',
      Embarked: 'Q'
    }
    @continuous_features = (Hash[random_forest.continuous_features.product([3])])
  end

  def score
    random_forest = Scoruby.load_model 'app/pmmls/titanic_rf.pmml'

    @features = {
      Sex: params['sex'],
      Embarked: params['embarked']
    }

    @continuous_features = random_forest.continuous_features.each_with_object({}) do |feature, hash|
      hash[feature] = params[feature].to_f
    end

    begin
      @score = random_forest.predict(@features.merge(@continuous_features))
    rescue => e
      @score = e
    end

    respond_to do |format|
      format.html { render 'scores/index' }
    end
  end
end