class ScoresController < ApplicationController
  def index
    model = MainModel.set_model 'app/pmmls/titanic_rf.pmml'
    @model_view_data = ModelViewData.new(model, {})
  end

  def score
    model = MainModel.get_model
    @model_view_data = ModelViewData.new(model, params)

    respond_to do |format|
      format.html { render 'scores/index' }
    end
  end
end