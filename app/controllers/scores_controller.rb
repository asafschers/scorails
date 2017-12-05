class ScoresController < ActionController::Base
  
  def score
    @params = params
    random_forest = Scoruby.load_model 'app/pmmls/titanic_rf.pmml'

    @features =  {
      Sex: 'male',
      Parch: params['parch'].to_f,
      Age: params['age'].to_f,
      Fare: params['fare'].to_f,
      Pclass: params['pclass'].to_f,
      SibSp: params['sibsp'].to_f,
      Embarked: 'Q'
    }

    @score = random_forest.predict(@features)

    respond_to do |format|
      format.html { render 'scores/index' }
    end
  end
end