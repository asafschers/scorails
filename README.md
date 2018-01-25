[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

# Scorails

<a href="https://pacific-reef-10143.herokuapp.com">Example Website</a> <br><br>
 
## About  
Web User Interface that loads Random Forest PMML file.   <br>
Provides a web UI to send features and receive scores. <br>
The technology stack for this project is built entirely on Ruby with Rails and <a href="https://github.com/asafschers/scoruby">Scoruby</a>.<br>
## Usage
Fork this repo, add your model's PMML file, and direct ScoresController to it. <br>
The scoring form will be rendered with your model's input fields.

## Train Model and export to PMML 

<a href="https://medium.com/@aschers/deploy-machine-learning-models-from-r-research-to-ruby-go-production-with-pmml-b41e79445d3d">This blog post</a> demonstrates how to -

Download a data set                                    <br>
Train a Random Forest model in R  <br>
Export the model to a PMML file                    <br>
Load the PMML file in Ruby with Scoruby  <br>
Send features to the loaded model and score 

## Next Steps                                                        
Web User Interface design                                         <br>
Load PMML files                                                   <br>
Support more models                                               <br>
User Interface for exploring Trees and Ensembles                  <br>



