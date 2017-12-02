class ScoresController < ActionController::Base

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: {} }
    end
  end
end