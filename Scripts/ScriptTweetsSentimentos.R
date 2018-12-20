library(tm)

if (!require("pacman")) install.packages("pacman")
pacman::p_load_current_gh("trinker/lexicon", "trinker/sentimentr")

if (!require("googleLanguageR")) install.packages("googleLanguageR")
library(googleLanguageR)
gl_auth("/home/joao/CredenciaisTradutor.json")

tweets_clean <- tolower(tweets)
tweets_clean <- clean_text_regex(tweets_clean)  
tweets_clean <- sentimentr::replace_emoticon(tweets_clean)
tweets_clean <- sentimentr::replace_emoji(tweets_clean)
tweets_clean <- restore_punctuation(tweets_clean)

tweets_translated <- gl_translate(tweets_clean, target = "en")$translatedText

tweets_translated <- get_sentences(tweets_translated)
out <- sentiment_by(tweets_translated)
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
