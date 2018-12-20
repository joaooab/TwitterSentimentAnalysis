clean_text_regex <- function(text) {
  text <- gsub("text:", "", text)
  text <- gsub("\\\\n", "", text)
  text <- gsub("https:.*? ", "", text)
  text <- gsub("https:.*?$", "", text)
  text <- gsub("@.*? ", "", text)
  text <- gsub("@.*?$", "", text)
  
  #Nomes próprios
  text <- gsub("\\b(bolsonaro)\\b", "Bolsonaro", text)
  text <- gsub("\\b(lula)\\b", "Lula", text)
  text <- gsub("\\b(dilma)\\b", "Dilma", text)
  text <- gsub("\\b(jair)\\b", "Jair", text)
  text <- gsub("\\b(alckimin)\\b", "Alckimin", text)
  
  #Correção de abreviações
  text <- gsub("\\b(jb)\\b", "Jair Bolsonaro", text)
  text <- gsub("\\b(n)\\b", "não", text)
  text <- gsub("\\b(q)\\b", "que", text)
  text <- gsub("\\b(fb)\\b", "Facebook", text)
  text <- gsub("\\b(fds)\\b", "final de semana", text)
  text <- gsub("\\b(sqn)\\b", "só que não", text)
  text <- gsub("\\b(fikdik)\\b", "Fica a dica", text)
  text <- gsub("\\b(brinks)\\b", "brincadeira", text)
  text <- gsub("\\b(pdc)\\b", "pode crer", text)
  text <- gsub("\\b(pfv)\\b", "por favor", text)
  text <- gsub("\\b(pfvr)\\b", "por favor", text)
  text <- gsub("\\b(kd)\\b", "cade", text)
  text <- gsub("\\b(pq)\\b", "porque", text)
  text <- gsub("\\b(oq)\\b", "o que", text)
  text <- gsub("\\b(fdp)\\b", "filha da puta", text)
  text <- gsub("\\b(fdps)\\b", "filha da puta", text)
  
  #Correção ortográfica
  text <- gsub("\\b(pe)\\b", "pé", text)
  text <- gsub("\\b(esplode)\b", "explode", text)
  text <- gsub("\\b(sao)\\b", "são", text)
  
  return(text)
}

restore_punctuation <- function(text) {
  text <- gsub("<c3><a3>", "ã", text)
  text <- gsub("<c3><a0>", "à", text)
  text <- gsub("<c3><a1>", "á", text)
  text <- gsub("<c3><a2>", "â", text)
  
  text <- gsub("<e1><ba><bd>", "ẽ", text)
  text <- gsub("<c3><a8>", "è", text)
  text <- gsub("<c3><a9>", "é", text)
  text <- gsub("<c3><aa>", "ê", text)
  
  text <- gsub("<c4><a9>", "ĩ", text)
  text <- gsub("<c3><ac>", "ì", text)
  text <- gsub("<c3><ad>", "í", text)
  text <- gsub("<c3><ae>", "í", text)
  
  text <- gsub("<c3><b5>", "õ", text)
  text <- gsub("<c3><b2>", "ò", text)
  text <- gsub("<c3><b3>", "ó", text)
  text <- gsub("<c3><b4>", "ô", text)
  
  text <- gsub("<c5><a9>", "ũ", text)
  text <- gsub("<c3><b9>", "ù", text)
  text <- gsub("<c3><ba>", "ú", text)
  text <- gsub("<c3><bb>", "û", text)
  
  text <- gsub("<c3><a7>", "ç", text)
  text <- gsub("<e2><80><94>", "-", text)
  text <- gsub("<e2><80><93>", "-", text)
  text <- gsub("<e2><80><a6>", "...", text)
  text <- gsub("<e2><80><9c>", "", text)
  text <- gsub("<e2><80><9d> ", "", text)
  text <- gsub("<c2><b0>", "º", text)
  text <- gsub("<f0><9f><a4><a3>", "", text)

  return(text)
}
