install.packages("tm", dependencies=TRUE)
install.packages("twitteR" ,dependencies =  TRUE)
install.packages("wordcloud")
install.packages("syuzhet")

library(twitteR)
library(tm)
library(wordcloud)
library(syuzhet)
library(ggplot2)
library(dplyr)

testdata <- read.csv(file="~/PycharmProjects/CovidTwitterSentimentAnalysis/covidvaccine.csv")
tweetsdata <- testdata$text
#convert all text to lower case
testdata$text <- iconv(testdata$text,"WINDOWS-1252","UTF-8")
testdata_text <- tolower(testdata$text)

# Replace blank space (ârtâ)
testdata_text <- gsub("rt", "", testdata_text)
# Replace @UserName
testdata_text <- gsub("@\\w+", "", testdata_text)

# Remove punctuation
testdata_text <- gsub("[[:punct:]]", "", testdata_text)

# Remove links
testdata_text <- gsub("http\\w+", "", testdata_text)

# Remove tabs
testdata_text <- gsub("[ |\t]{2,}", "", testdata_text)

# Remove blank spaces at the beginning
testdata_text <- gsub("^ ", "", testdata_text)

# Remove blank spaces at the end
testdata_text <- gsub(" $", "", testdata_text)

testdata_text_corpus <- Corpus(VectorSource(testdata_text))
testdata_text_corpus <- Corpus(VectorSource(testdata_text))
testdata_text_corpus <- tm_map(testdata_text_corpus, function(x)removeWords(x,stopwords()))

#sentiment analysis
#testdata_text_sent<-get_nrc_sentiment((testdata_text))
#testdata_text_sent_score<-data.frame(colSums(testdata_text_sent[,]))

if (!require("pacman")) install.packages("pacman")
pacman::p_load_current_gh("trinker/lexicon", "trinker/sentimentr")

tweets_data <- get_sentences(tweetsdata)
out <- sentiment_by(tweets_data)
out[is.na(out)] <- 0
library(ggplot2)
ggplot(out, aes(x = Valor_Polaridade, y = Desvio_Padrao)) +
  geom_point(aes(x = ave_sentiment, y = sd), alpha = 0.4) +
  geom_point(aes(x = mean(ave_sentiment), y = mean(sd)), colour = 'red', size = 3) +
  geom_point(aes(x = median(ave_sentiment), y = median(sd)), colour = 'blue', size = 3) +
  xlim(-1.0, 1.0) +
  ylim(0.0, 1.0)

library(dplyr)
out_mean = c(mean(out$ave_sentiment), mean(out$sd))
tweets_positive = out %>% filter(ave_sentiment > 0)
tweets_negative = out %>% filter(ave_sentiment < 0)
tweets_neutral = out %>% filter(ave_sentiment == 0)
tweets_positive_mean = c(mean(tweets_positive$ave_sentiment), mean(tweets_positive$sd))
tweets_negative_mean = c(mean(tweets_negative$ave_sentiment), mean(tweets_negative$sd))

