clean_corpus <- function(corpus){
  corpus <- tm_map(corpus, content_transformer(tolower)) #transforma plavras do texto em minúsculo
  corpus <- tm_map(corpus, content_transformer(removeWords), stopwords::stopwords("pt", source = "snowball")) #remove stopwords pt-br
  corpus <- tm_map(corpus, stripWhitespace) #remove tabulações
  corpus <- tm_map(corpus, removePunctuation) #remove acentuações
  corpus <- tm_map(corpus, removeNumbers) #remove números
  return(corpus)
}

clean_corpus_regex <- function(corpus){
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "text:", replacement = "")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "\\\\n", replacement = "")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "https:.*? ", replacement = "")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "https:.*?$", replacement = "")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "@.*? ", replacement = "")
  
  return(corpus)
}