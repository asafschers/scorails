class ModelViewData
  delegate :view_data, :score_data, to: :@categorical_features, prefix: :categorical

  def initialize(model, params)
    @model = model
    @params = params
    @categorical_features = CategoricalFeatures.new(model.categorical_features,
                                                    params)
  end

  def score
    @model.score(features)
  rescue => e
    e
  end

  def continuous_features
    @params.nil? ? default_continuous_features : input_continuous_features
  end

  private

  def features
    continuous_features.merge(categorical_score_data)
  end

  def input_continuous_features
    @model.continuous_features.each_with_object({}) do |feature, hash|
      hash[feature] = @params && @params[feature].present? ? @params[feature].to_f : nil
    end
  end

  def default_continuous_features
    (Hash[@model.continuous_features.product([3])])
  end
end