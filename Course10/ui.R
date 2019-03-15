#ui.R

library(shiny)
library(markdown)

## SHINY UI
shinyUI(
  fluidPage(
    titlePanel("Datascience Capstone Project: Next Word Predictor (NLP) :"),
    sidebarLayout(
      sidebarPanel(
        helpText("Enter a phrase or word you would like help completing"),
        hr(),
        helpText("Text will be grey while code is running. When word is found, text will turn black."),
        textInput("inputText", "Enter:",value = ""),
        hr(),
        hr(),
        hr()
      ),
      mainPanel(
        strong("Phrase or word entered:"), 
        strong((textOutput('sentence1'))),
        br(),
        strong((textOutput('sentence2'))),
        br(),
        h2("The next word is"),
        verbatimTextOutput("prediction"),
        hr(),
        hr(),
        hr()
      )
    )
  )
)
