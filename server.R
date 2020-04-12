#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tm)

# setwd("/Users/Jane/Documents/Data Science/c10/w7/FinalProject")
load("data.RData")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        output$out <- renderPrint({
                xclean <- removeNumbers(removePunctuation(tolower(input$box)))
                xwords <- strsplit(xclean, " ")[[1]]
                pred <- 0
                
                if (length(xwords) >= 2) {
                        xwords <- tail(xwords, 2)
                        search <- paste(xwords[1], xwords[2])
                        search <-
                                paste("^", search, " ", sep = "")
                        results <-
                                trigram_df[grep(search, trigram_df$trigram), ]
                        if (length(results[, 1]) != 0) {
                                pred <- strsplit(as.character(results$trigram[1]),
                                                 " ")[[1]][3]
                        }
                }
                if (pred == 0) {
                        xwords <- tail(xwords, 1)
                        search <-
                                paste("^", xwords, " ", sep = "")
                        results <-
                                bigram_df[grep(search, bigram_df$bigram), ]
                        if (length(results[, 1]) != 0) {
                                pred <- strsplit(as.character(results$bigram[1]),
                                                 " ")[[1]][2]
                        }
                }
                if (pred == 0) {
                        pred <- as.character(unigram_df$unigram[1])
                }
                pred
        })
})