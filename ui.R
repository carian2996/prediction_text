
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
shinyUI(
    navbarPage("Word Prediction Text: Capstone Project", 
                   tabPanel("Predict!", (includeScript("googanalytics.js")),
                            sidebarLayout(
                                sidebarPanel(
                                    h4("How to use this app?",  align = "center"),
                                    strong("Text input:"),
                                    p("Type a sentence into the text box, and this will predict your next possible word.", align = "justify"),
                                    textInput("phrase", 
                                              label = "Write your phrase here:", 
                                              value = "I live in New York"),
                                    strong("Help:"),
                                    p("This fuction works in the next way:"),
                                    p("1. You text your phrase into the box."),
                                    p("2. The app, use the model asigned for search a possible next word."),
                                    p("3. Returns five possible options for you."),
                                    strong("Note:"),
                                    p("For more accuracy, text a phrase with logic. Remember that this is not a commercial product and can be wrong in some way. Thank you", align = "justifed"),
                                    h6(strong("For more information, visit:")),
                                    p(a(href = "http://www.coursera.org/specialization/jhudatascience/1", "Data Science Specialization")),
                                    p(a(href = "http://www.coursera.org/course/dsscapstone", "Capstone Project")),
                                    p(a(href = "http://en.wikipedia.org/wiki/Natural_language_processing", "Natural Language Processing")),
                                    p("This app was built by Ian Castillo")
                                ),
                                mainPanel(
                                    h2("Word Prediction"),
                                    p(strong("A single word prediction:")),
                                    wellPanel(span(h5(textOutput("prediction1")))),
                                    p(strong("A few more possibles words:")),
                                    wellPanel(span(h5(textOutput("prediction2")), style = "color:#2b8c1b"), 
                                              span(h5(textOutput("prediction3")), style = "color:#2b8c1b"),
                                              span(h5(textOutput("prediction4")), style = "color:#2b8c1b"),
                                              span(h5(textOutput("prediction5")), style = "color:#2b8c1b")),
                                    hr()
                                )
                                )
                            ),
                   tabPanel("About the Corpus", 
                            sidebarLayout(
                                sidebarPanel(
                                    p("Aquí va algo")
                                ),
                                mainPanel(
                                    tabsetPanel(type="tabs",
                                                tabPanel("Corpus Information", 
                                                         p("Aquí va algo 1")
                                                         ),
                                                tabPanel("Exploratory Analysis", 
                                                         p("Aquí va algo 2")
                                                         )
                                                )
                                    )
                                )
                            ),
                   tabPanel("Model",
                            sidebarLayout(
                                sidebarPanel(
                                    p("Aquí va algo")
                                ),
                                mainPanel(
                                    h3("Process of Prediction Algorithm"),
                                    hr(),
                                    img(src="process.png", height = 400, width = 850),
                                    hr()
                                    )
                                )
                            ),
               navbarMenu("More",
                          tabPanel("Final Report", 
                                       sidebarLayout(
                                           sidebarPanel(
                                               p("Aquí va algo")
                                           ),
                                           mainPanel(
                                               h3("Aquí va el reporte final")
                                           )
                                       )
                                   ),
                          tabPanel("About Me",
                                       sidebarLayout(
                                           sidebarPanel(
                                               p("Hi! My name is Ian, I'm from Mexico and I'm 23 years"),
                                               p("Thanks for testing my app, I hope you enjoyed as much as I did it develop it."),
                                               p("Any comments or complaint you can sent me an email to:"),
                                               p(strong("iancastillorosales@gmail.com"))
                                           ),
                                           mainPanel(
                                               h3("Professional Experience"),
                                               p("You can find more information about me, here:"),
                                               a(img(src = "me_github.png", height = 30, width = 30),href="http://github.com/carian2996"),
                                               a(img(src = "me_linkedin.png", height = 35, width = 35),href="http://www.linkedin.com/in/castillorosalesian"),
                                               h3("Personal Info"),
                                               p("Or, in my GSite:"),
                                               a(img(src = "me_gsite.jpeg", height = 35, width = 35),href="http://sites.google.com/site/castillorosalesian/")
                                           )
                                       )
                                   )
               )
                   )
        )