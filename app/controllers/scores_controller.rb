class ScoresController < ActionController::Base

  def index
    random_forest = Scoruby.load_model 'app/pmmls/titanic_rf.pmml'
    @features =  {
      Sex: 'male',
      Parch: 1,
      Age: 50,
      Fare: 30,
      Pclass: 2,
      SibSp: 1,
      Embarked: 'Q'
    }
    @continuous_features = random_forest.continuous_features
  end

  def score
    random_forest = Scoruby.load_model 'app/pmmls/titanic_rf.pmml'

    @features = {
      Sex: params['sex'],
      Parch: params['Parch'].to_f,
      Age: params['Age'].to_f,
      Fare: params['Fare'].to_f,
      Pclass: params['Pclass'].to_f,
      SibSp: params['SibSp'].to_f,
      Embarked: params['embarked']
    }

    @continuous_features = random_forest.continuous_features

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