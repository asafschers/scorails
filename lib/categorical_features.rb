class CategoricalFeatures
  def initialize(categorical_features, params)
    @categorical_features = categorical_features
    @params = params
  end

  def view_data
    @categorical_features.keys.each_with_object({}) do |feature, hash|
      hash[feature] = {
        list: @categorical_features[feature],
        selected: @params[feature]
      }
    end
  end

  def score_data
    @categorical_features.keys.each_with_object({}) do |feature, hash|
      hash[feature] = @params[feature]
    end
  end
end