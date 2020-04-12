#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Prediction App"),
  
  sidebarLayout(
          sidebarPanel(
                  textInput("box", "This app takes as input a phrase in a text box input and outputs a prediction of the next word.", value = ""),
                  submitButton("Submit")
          ),
          mainPanel(
                  h3("Prediction of next word:"),
                  textOutput("out")
                  )
          )
))