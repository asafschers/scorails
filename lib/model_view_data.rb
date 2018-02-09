class ModelViewData
  def initialize(model, params)
    @model = model
    @params = params
  end

  def score
    @model.score(features)
  rescue => e
    e
  end

  def categories
    @model.categorical_features
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
    @model.categorical_features.keys.each_with_object({}) do |feature, hash|
      hash[feature] = @params[feature]
    end
  end

  def default_categorical_features
    categories.transform_values(&:first)
  end

  def input_continuous_features
    @model.continuous_features.each_with_object({}) do |feature, hash|
      hash[feature] = @params[feature].to_f
    end
  end

  def default_continuous_features
    (Hash[@model.continuous_features.product([3])])
  end
end