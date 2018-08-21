install.packages("googleLanguageR")
library(googleLanguageR)
gl_auth("/home/joao/CredenciaisTradutor.json")
text <- "Meu primeiro texto traduzido"
gl_translate(text, target = "en")$translatedText
