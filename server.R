
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(wordcloud)
library(dplyr)

load("final_workspace.RData", .GlobalEnv)
source("prediction.R")

shinyServer(
    function(input, output) {
        
        data_input <- reactive(predict_word(input$phrase))
        
        output$prediction1 <- renderText({
            paste(input$phrase, data_input()[1])
        })
        
        output$prediction2 <- renderText({
            paste(input$phrase, data_input()[2])
        })
        
        output$prediction3 <- renderText({
            paste(input$phrase, data_input()[3])
        })
        
        output$prediction4 <- renderText({
            paste(input$phrase, data_input()[4])
        })
        
        output$prediction5 <- renderText({
            paste(input$phrase, data_input()[5])
        })
    }
    )