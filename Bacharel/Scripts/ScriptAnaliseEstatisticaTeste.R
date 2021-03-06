

#---------------------WORD_ASSOCIATE----------------------
library(qdap)
word_associate(tweets[2:100], match.string = c("bolsonaro"),
               stopwords = c('jair'),
               network.plot = TRUE,
               cloud.colors = c("gray85", "darkred"))
# Add title
title(main = "Bolsonar Tweet Associations")

word_network_plot(tweets[2:2], grouping.var = 2:2, stopwords = c(stopwords::stopwords("pt", source = "snowball"),c,'https','text'),
                  edge.color = "gray70", label.colors = "darkred")

#---------------------DENDOGRAM----------------------
install.packages("dendextend")
library("dendextend")
library(dplyr)

glimpse(word_freqs)

word_freqs = word_freqs %>% arrange(desc(num)) %>% filter(num > 10)

tweets_source <- VectorSource(word_freqs)
tweets_corpus <- VCorpus(tweets_source)

#Tratamento dos Dados adicionar script clean_corpus e fazer run e todas as linhas
tweets_corpus_clean <- clean_corpus(tweets_corpus)

#Cria Matriz
tweets_tdm <- TermDocumentMatrix(tweets_corpus)
tweets_m <- as.matrix(tweets_tdm)

tweets_tdm$dimnames$Terms = as.character(word_freqs$term)
tweets_tdm$nrow = length(word_freqs$term)
glimpse(tweets_tdm$dimnames$Terms)

tweets_dist <- dist(tweets_tdm[,100], method = "euclidean")
tweets_hc <- hclust(tweets_dist)
tweets_hcd <- as.dendrogram(tweets_hc)
plot(tweets_hcd, main = "Tweets Dendrogram")