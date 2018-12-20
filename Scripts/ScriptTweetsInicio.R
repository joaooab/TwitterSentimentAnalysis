library(tm)

tweets <- haddad_2$text
tweets_source <- VectorSource(tweets)
tweets_corpus <- VCorpus(tweets_source)

tweets_corpus_clean_regex <- clean_corpus_regex(tweets_corpus)
tweets_corpus_clean <- clean_corpus(tweets_corpus_clean_regex)

tweets_tdm <- TermDocumentMatrix(tweets_corpus_clean)
tweets_m <- as.matrix(tweets_tdm)

#--------------------------BAR_PLOT----------------------
#Ordena frequencia dos termos
term_frequency <- rowSums(tweets_m)
term_frequency <- sort(term_frequency,decreasing = TRUE)
barplot(term_frequency[2:30], main = "Histograma 30 palavras mais frequentes", ylim = c(0,500), ylab = "Quantidade",
        col = "blue", las = 2)

#-----------------------WORD_CLOUD----------------------
install.packages("wordcloud")
library("wordcloud")
word_freqs <- data.frame(term = names(term_frequency),num = term_frequency)
wordcloud(word_freqs$term, word_freqs$num, scale = c(4, 0.5), min.freq = 2, max.words = 500, random.order=FALSE, rot.per=0.5,
          colors=brewer.pal(8, "Dark2"))

