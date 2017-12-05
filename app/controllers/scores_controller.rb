class ScoresController < ActionController::Base

  def index
    @features =  {
      Sex: 'male',
      Parch: 1,
      Age: 50,
      Fare: 30,
      Pclass: 2,
      SibSp: 1,
      Embarked: 'Q'
    }
  end

  def score
    @params = params
    random_forest = Scoruby.load_model 'app/pmmls/titanic_rf.pmml'

    @features =  {
      Sex: params['sex'],
      Parch: params['parch'].to_f,
      Age: params['age'].to_f,
      Fare: params['fare'].to_f,
      Pclass: params['pclass'].to_f,
      SibSp: params['sibsp'].to_f,
      Embarked: params['embarked']
    }

    begin
      @score = random_forest.predict(@features)
    rescue => e
      @score = e
    end

    respond_to do |format|
      format.html { render 'scores/index' }
    end
  end
end