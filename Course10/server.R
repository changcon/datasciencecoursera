# Coursera DataScience Capstone Server.R
# Contains NextWordPredict function which takes
# a pre-processed data.table object which consists
# of 2-grams, 3-grams, and 4-grams sorted by instance
# with the top next word in the table
# preprocessing is done in Preprocessing_Data.R

library(shiny)
library(quanteda)
library(readtext)
library(RcppParallel)
library(ggplot2)
library(stringr)
library(data.table)

lkp_dt<-readRDS(file="lkp_dt.rds")

NextWordPredict <- function( lkp_str, lkp_dt ) {
  lkp_vec <- strsplit( lkp_str, "\\s+" )[[ 1 ]]
  pred <- NA_character_
  while( length( lkp_vec ) > 0 && is.na( pred ) ) {
    lkp_str <- paste0( lkp_vec, collapse = "_" )
    lkp_vec <- tail( lkp_vec, -1 )
    pred <- lkp_dt[ lkp_str, prediction, nomatch = NA ]
  }
  
  if( is.na(pred) ) pred<-"No word found"

  pred
}

	
# example call
# NextWordPredict("i love you", lkp_dt)

shinyServer(function(input, output) {
  output$prediction <- renderPrint({
    result <- (NextWordPredict(input$inputText,lkp_dt))
    result
  });
  output$sentence1 <- renderText({
    input$inputText});
}
)

