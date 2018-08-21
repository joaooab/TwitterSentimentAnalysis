clean_text_regex <- function(text) {
  text <- gsub("text:", "", text)
  text <- gsub("\\\\n", "", text)
  text <- gsub("https:.*? ", "", text)
  text <- gsub("https:.*?$", "", text)
  text <- gsub("@.*? ", "", text)
  
  return(text)
}
