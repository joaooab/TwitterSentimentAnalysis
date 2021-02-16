if (!require("pacman")) install.packages("pacman")
pacman::p_load_current_gh("trinker/lexicon", "trinker/sentimentr")

mytext <- c(
  'do you like it?  But I hate really bad dogs',
  'I am the best friend.',
  'Do you really like it?  I\'m not a fan'
)

mytext <- get_sentences(mytext)
sentiment(mytext)

text <- "eu estou muito ☺ "
text <- sentimentr::replace_emoji(text)
text

text <- "Humildade, simplicidade e autenticidade são as características de Bolsonaro, como não votar nele?"
text
text <- gl_translate(text, target = "en")$translatedText
text 
text <- get_sentences(text)
text
sentiment(text)
sentiment_by(text)
plot(sentiment(mytext))


