class ScoresController < ActionController::Base

  def index
    random_forest = Scoruby.load_model 'app/pmmls/titanic_rf.pmml'
    @random_forest_view_data = RandomForestViewData.new(random_forest, nil)
  end

  def score
    random_forest = Scoruby.load_model 'app/pmmls/titanic_rf.pmml'
    @random_forest_view_data = RandomForestViewData.new(random_forest, params)

    respond_to do |format|
      format.html { render 'scores/index' }
    end
  end
end