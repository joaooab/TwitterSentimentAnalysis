library(tm)
tweetsBolso <- read.csv("~/Desktop/tweetsBolsoFormatado.csv", stringsAsFactors = FALSE, sep = ';')
tweets <- tweetsBolso$text
tweets_source <- VectorSource(tweets)
tweets_corpus <- VCorpus(tweets_source)

tweets_corpus <- tm_map(tweets_corpus, content_transformer(removeWords), "text") "Remove a tag text"
tweets_corpus <- tm_map(tweets_corpus, stripWhitespace) #remove tabulações
tweets_corpus <- tm_map(tweets_corpus, removePunctuation) #remove acentuações
tweets_corpus <- tm_map(tweets_corpus, content_transformer(tolower)) #transforma plavras do texto em minúsculo
tweets_corpus <- tm_map(tweets_corpus, removeNumbers) #remove números
#remover stopwords pt-br
tweets_corpus <- tm_map(tweets_corpus, content_transformer(removeWords), stopwords::stopwords("pt", source = "snowball"))



