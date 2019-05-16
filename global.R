# Load necessary libraries
library("shinyBS")
library("shinydashboard")
library("shinyjs")
suppressWarnings(library(tm))
suppressWarnings(library(stringr))
suppressWarnings(library(shiny))
suppressWarnings(library(markdown))

# Back Off Algorithm
# Predict the next word for the given ngram
# 1. Quadgram is first used (first three words of Quadgram are the last three words of the user input).
# 2. If no Quadgram is found, back off to Trigram (first two words of Trigram are the last two words of the user input).
# 3. If no Trigram is found, back off to Bigram (first word of Bigram is the last word of the user input)
# 4. If no Bigram is found, back off to the most common word with highest frequency i.e word 'the' is returned.

# Read Quadgram,Trigram & Bigram RData files which are created in earlier tasks

quadgram <- readRDS("data/quadgram.RData");
trigram <- readRDS("data/trigram.RData");
bigram <- readRDS("data/bigram.RData");

# Format user input before predicting the next word

Predict <- function(w) {
  wformat <- removeNumbers(removePunctuation(tolower(w)))
  wsplit <- strsplit(wformat, " ")[[1]]

  if (length(wsplit)>= 3) {
    wsplit <- tail(wsplit,3)
    if (identical(character(0),head(quadgram[quadgram$unigram == wsplit[1] & quadgram$bigram == wsplit[2] & quadgram$trigram == wsplit[3], 4],1))){
      Predict(paste(wsplit[2],wsplit[3],sep=" "))
    }
    else {head(quadgram[quadgram$unigram == wsplit[1] & quadgram$bigram == wsplit[2] & quadgram$trigram == wsplit[3], 4],1)}
  }
  else if (length(wsplit) == 2){
    wsplit <- tail(wsplit,2)
    if (identical(character(0),head(trigram[trigram$unigram == wsplit[1] & trigram$bigram == wsplit[2], 3],1))) {
      Predict(wsplit[2])
    }
    else {head(trigram[trigram$unigram == wsplit[1] & trigram$bigram == wsplit[2], 3],1)}
  }
  else if (length(wsplit) == 1){
    wsplit <- tail(wsplit,1)
    if (identical(character(0),head(bigram[bigram$unigram == wsplit[1], 2],1))) {head("the",1)}
    else {head(bigram[bigram$unigram == wsplit[1],2],1)}
  }
}