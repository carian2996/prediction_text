
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
        
        output$bar_char <- renderImage({
            
            if(input$select == 1){
                return(
                    list(
                        src = "www/enlgish.png",
                        contentType = "image/png",
                        alt = "English"
                    )
                )
            } else if(input$select == 2){
                return(
                    list(
                        src = "www/deutsch.png",
                        contentType = "image/png",
                        alt = "Deutsch"
                    )
                )
            } else if(input$select == 3){
                return(
                    list(
                        src = "www/finnish.png",
                        contentType = "image/png",
                        alt = "Finnish"
                    )
                )
            }
            
        }, deleteFile = FALSE)
        
        output$wordcloud <- renderImage({
            
            if(input$wordcloud == 1){
                return(
                    list(
                        src = "www/wc1.png",
                        contentType = "image/png",
                        alt = "Tokens"
                    )
                )
            } else if(input$wordcloud == 2){
                return(
                    list(
                        src = "www/wc2.png",
                        contentType = "image/png",
                        alt = "2-gram"
                    )
                )
            } else if(input$wordcloud == 3){
                return(
                    list(
                        src = "www/wc3.png",
                        contentType = "image/png",
                        alt = "3-gram"
                    )
                )
            } else if(input$wordcloud == 4){
                return(
                    list(
                        src = "www/wc4.png",
                        contentType = "image/png",
                        alt = "4-gram"
                    )
                )
            }
            
        }, deleteFile = FALSE)
    }
    )