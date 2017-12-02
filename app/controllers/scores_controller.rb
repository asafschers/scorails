class ScoresController < ActionController::Base

  def index
    random_forest = Scoruby.load_model 'app/pmmls/titanic_rf.pmml'
    @features =  {
      Sex: 'male',
      Parch: 0,
      Age: 30,
      Fare: 9.6875,
      Pclass: 2,
      SibSp: 0,
      Embarked: 'Q'
    }
    
    @score = random_forest.predict(@features)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: { score: @score, features: @features } }
    end
  end

  def score
    puts 1
    
    respond_to do |format|
      format.html # score.html.erb
      format.json { render json: {  } }
    end
  end
end