if (!require("pacman")) install.packages("pacman")
pacman::p_load_current_gh("trinker/lexicon", "trinker/sentimentr")

tweets_clean <- clean_text_regex(tweets)
tweets_clean <- replace_emoji(tweets_clean)

if (!require("googleLanguageR")) install.packages("googleLanguageR")
library(googleLanguageR)
gl_auth("/home/joao/CredenciaisTradutor.json")

tweets_clean <- gl_translate(text, target = "en")$translatedText

