class MainModel
  def self.set_model(path)
    @model = Scoruby.load_model path
  end

  def self.get_model
    @model || set_model('app/pmmls/titanic_rf.pmml')
  end
end