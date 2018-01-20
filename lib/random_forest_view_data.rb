class RandomForestViewData
  def initialize(random_forest, params)
    @random_forest = random_forest
    @params = params
  end

  def score
    @random_forest.predict(features)
  rescue => e
    e
  end

  def categories
    @random_forest.categorical_features
  end

  def categorical_values
    @params.nil? ? default_categorical_features : input_categorical_features
  end

  def continuous_features
    @params.nil? ? default_continuous_features : input_continuous_features
  end

  private

  def features
    continuous_features.merge(categorical_values)
  end

  def input_categorical_features
    @random_forest.categorical_features.keys.each_with_object({}) do |feature, hash|
      hash[feature] = @params[feature]
    end
  end

  def default_categorical_features
    categories.transform_values(&:first)
  end

  def input_continuous_features
    @random_forest.continuous_features.each_with_object({}) do |feature, hash|
      hash[feature] = @params[feature].to_f
    end
  end

  def default_continuous_features
    (Hash[@random_forest.continuous_features.product([3])])
  end
end