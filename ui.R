
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
                                    p("1. You text your phra
                                      se into the box."),
                                    p("2. The app, use the model asigned for search a possible next word."),
                                    p("3. Returns five possible options for you."),
                                    strong("IMPORTANT:"),
                                    p("For more accuracy, text a phrase with logic. Remember that this is not a commercial product and can be wrong in some way. Thank you", align = "justifed"),
                                    h6(strong("For more information, visit:")),
                                    p(a(href = "http://www.coursera.org/specialization/jhudatascience/1", "Data Science Specialization")),
                                    p(a(href = "http://www.coursera.org/course/dsscapstone", "Capstone Project")),
                                    p(a(href = "http://en.wikipedia.org/wiki/Natural_language_processing", "Natural Language Processing")),
                                    p("This app was built by Ian Castillo for the Capstone Project (supported by", 
                                      a(href = "http://www.swiftkey.com", "Swiftkey"),
                                      ") in the Data Science Specialization offert by Coursera")
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
                                    p("In linguistics, a corpus (plural corpora) or text corpus is a large and structured set of texts (nowadays usually electronically stored and processed).", align = "justified"),
                                    p("In this section you can see the corpora used in the model's train. To access the raw data you can click on the next link:", align = "justified"),
                                    a(href = "http://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip", "Capstone Dataset"),
                                    p("The corpora contains different languages, including:", align = "justified"),
                                    p("- Dutch"),
                                    p(strong("- English (used to train the model)")),
                                    p("- Finnish"),
                                    p("- Russian"),
                                    h4("Content and size"),
                                    p("Every language contains three different sources:", align = "justified"),
                                    p("- Blogs"),
                                    p("- News"),
                                    p("- Twitter")
                                ),
                                mainPanel(
                                    tabsetPanel(type="tabs",
                                                tabPanel("Corpus Information",
                                                         h2("Corpora's source"),
                                                         p("The corpora are collected from publicly available sources by a web crawler. The crawler checks for language, so as to mainly get texts consisting of the desired language.", align = "justified"),
                                                         h2("Documents used"),
                                                         ("The size of each document in the corpora is between 24.75Mb (Twitter) and 205.25 Mb (Blogs)."),
                                                         p("For this project, It was use the English Corpora. First we extract a sample of each document. A sample of 150,000 raws from the corpora was divided into two groups, a train set and a test set.", align = "justified"),
                                                         p("A basic summary of the corpus shows that:"),
                                                         p("The number of words in the sample is", code("1,840,714")),
                                                         p("The number of tokens (unique words) in the sample is", code("105,137")), 
                                                         p("We can see the cumulative fuction in the dictionary, so, for fill the 50% of the text we need",
                                                           code("52569"), 
                                                           "words in the dictionary. For fill the 90% of the text we need",
                                                           code("94623")
                                                           ),
                                                         h3("Word Cloud"),
                                                         p("A word cloud is a graphical representation of word frequency. Below you can select the number of n-gram and see a word cloud frequency of the n-grams in the sampled text."),
                                                         selectInput("wordcloud", label = h5("Select n-gram:"), 
                                                                     choices = list("1" = 1, "2" = 2, "3" = 3, "4" = 4), 
                                                                     selected = 3),
                                                         hr(),
                                                         imageOutput("wordcloud")
                                                         ),
                                                tabPanel("Exploratory Analysis",
                                                         h2("Distribution of letters by words"),
                                                         hr(),
                                                         p("You can see the distribution of words by language, this is a simple way to analize what type of your are you seeing, depending of the letters in the word. As you can see, English and Deutsch are similar because both language are latin. You can see that the Finnish is significantly different because of the root of the language."),
                                                         selectInput("select", label = h5("Select language:"), 
                                                                     choices = list("English" = 1, "Deutsch" = 2, "Finnish" = 3, "Russian" = 4), 
                                                                     selected = 1),
                                                         p("In this sets, we only use ~ 7,000 - 10,000 length."),
                                                         hr(),
                                                         imageOutput("bar_char")
                                                         )
                                                )
                                    )
                                )
                            ),
                   tabPanel("Model",
                            sidebarLayout(
                                sidebarPanel(
                                    h3("What is NLP?"),
                                    p("Natural language processing (NLP) is a field of computer science, artificial intelligence, and computational linguistics concerned with the interactions between computers and human (natural) languages. As such, NLP is related to the area of human–computer interaction.", align = "justified"),
                                    p("Many challenges in NLP involve natural language understanding, that is, enabling computers to derive meaning from human or natural language input, and others involve natural language generation.[1]", align = "justified"),
                                    hr(),
                                    p("In this section, you can find some fo the principal concepts for understand the (simple) model used in this app.", align = "justified"),
                                    p("For more infomation abour NLP you can click in the follow links:"),
                                    p(a(href = "http://class.coursera.org/nlp/lecture/preview", "Standford NLP Coursera class")), 
                                    p(a(href = "http://www.cs.colorado.edu/~martin/SLP/Updates/1.pdf", "Speech and Language Processing")),
                                    h6("[1] Wikipedia NLP"),
                                    h6("[2] Wikipedia Tokenization")
                                ),
                                mainPanel(
                                    h3("Process of Prediction Algorithm"),
                                    hr(),
                                    h4("1. Get and load the data"),
                                    p("The first step into the process of construct this model was obtain the data and loaded into R. And easy task considering the",
                                      code("tm"),
                                      "package, with a variety of linguistic models to work within R. Basiclly the code was"
                                     ), 
                                    p(code("dirCorpus <- DirSource('~/MyDirectory/Data', encoding = 'UTF-8')")),
                                    p(code("corpus <- VCorpus(x = dirCorpus, readerControl = list(reader = readPlain, language = 'en'))")),
                                    hr(),
                                    h4("2. Sample the data"),
                                    p("In this step, I created a fuction",
                                      code("sample_text()"), 
                                      "to split the data with the", 
                                      code("caret"), 
                                      "package (details in my repository at GitHub). Both sets are converted into Volatile Corpus (more info with ?) with the next two functions",
                                      code("VCorpus()"), 
                                      "and", 
                                      code("VectorSource()")),
                                    hr(),
                                    h4("3. Clean the data"),
                                    p("The most challenging task was cleaning the data, remove puctuation, filtering words, numbers, process words into lower letters. To do this, I appeal again to the ",
                                      code("tm"),
                                      "package",
                                      "with some of the basic functions"
                                      ),
                                    p(code("tm_map"),
                                      code("removePunctuation"), 
                                      code("removeNumbers"), 
                                      code("toSpace"), 
                                      code("removeWords"), 
                                      code("stripWhitespace")),
                                    hr(),
                                    h4("4. Tokenization"),
                                    p("In lexical analysis, tokenization is the process of breaking a stream of text up into words, phrases, symbols, or other meaningful elements called tokens. The list of tokens becomes input for further processing such as parsing or text mining.[2]"),
                                    p("The next step is the tokenization of the text, I did it with my own fuction",
                                      code("tokenization_text"), 
                                      "and using the", 
                                      code("ngrams"), 
                                      "packages. You can specify the level of n-gram that you wish to usein your model."),
                                    hr(),
                                    h4("5. Prediction Model"),
                                    p("I decided to use the most simple way to predict a next word, a Markov Chain is a mathematical model where a sequence of random variables X1, X2, X3, ... with the Markov property, namely that, given the present state, the future and past states are independent"),
                                    p(img(src = "markov.png", height = 21, width = 628), align = "center"),
                                    p("With the Markov Property we can compute the probabilities of each token and implemented in our model. Finally, we use a simple 4-gram model to search for the next word, if the four wordin the 4-gram model isn't founded, the algorithm search in 3-gram, and so."),
                                    img(src="process.png", height = 395, width = 845),
                                    hr(), 
                                    h4("5. Smoothing"), 
                                    p("In a simple way, a smoothing technique is a generative language model that estimates the conditional probability of a word given its history in the n-gram."), 
                                    p("Due to time, I was no able to apply a correct use of a smooth and backoff models to solve the issue of non seen words and smooth of tokens probabilities. I hope that in less than a week I can implement the right choice in this model. "),
                                    hr()
                                    )
                                )
                            ),
               navbarMenu("More",
                          tabPanel("Final Report", 
                                   p(strong("Update"), ": Now, you can find a nice presentation here:"), 
                                   a(href = "rpubs.com/carian2996/capproj_pitch", "A Simple Word Prediction"),
                                   hr(),
                                   p("Here you can see the presentation:"),
                                   img(src = "pitch1.png", height = 400, width = 800),
                                   img(src = "pitch2.png", height = 400, width = 800), 
                                   img(src = "pitch3.png", height = 400, width = 800), 
                                   img(src = "pitch4.png", height = 400, width = 800), 
                                   img(src = "pitch5.png", height = 400, width = 800)
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
                                               p("Or, in my GSite:", a(img(src = "me_gsite.jpeg", height = 35, width = 35),href="http://sites.google.com/site/castillorosalesian/"))
                                           )
                                       )
                                   )
               )
                   )
        )