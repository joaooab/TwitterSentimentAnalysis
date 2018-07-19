clean_corpus <- function(corpus){
  corpus <- tm_map(corpus, stripWhitespace) #remove tabulações
  corpus <- tm_map(corpus, removePunctuation) #remove acentuações
  corpus <- tm_map(corpus, content_transformer(tolower)) #transforma plavras do texto em minúsculo
  corpus <- tm_map(tweets_corpus, removeNumbers) #remove números
  #remover stopwords pt-br
  corpus <- tm_map(tweets_corpus, content_transformer(removeWords), stopwords::stopwords("pt", source = "snowball"))
  tm_map(tweets_corpus, content_transformer(removeWords), "text") "Remove a tag text"
  return(corpus)
}

