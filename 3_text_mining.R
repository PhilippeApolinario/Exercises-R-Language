# Text Mining

library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

# Lendo o arquivo
dataset <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
texto <- readLines(dataset)

# Criando o Corpus
df_corpus <- Corpus(VectorSource(texto))

# Pré-processamento

# Inspeciona os metadados encontrados
inspect(df_corpus) 

# Buscar por uma padrão e substituir por espaço
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x)) 

# Aplicando a função na variável toSpace
df_corpus <- tm_map(df_corpus, toSpace, "/")
df_corpus <- tm_map(df_corpus, toSpace, "@") 
df_corpus <- tm_map(df_corpus, toSpace, "\\|")

# Convertendo para minúsculo
df_corpus <- tm_map(df_corpus, content_transformer(tolower))

# Removendo números
df_corpus <- tm_map(df_corpus, removeNumbers)

# Removendo as palavras mais comuns do idioma inglês
df_corpus <- tm_map(df_corpus, removeWords, stopwords("english"))

# Removendo pontuação
df_corpus <- tm_map(df_corpus, removePunctuation)

# Eliminando espaços extras
df_corpus <- tm_map(df_corpus, stripWhitespace) 

# Text stemming (Junta palavras que aparecem com muita frequência)
df_corpus <- tm_map(df_corpus, stemDocument)

# Convertendo em um matriz
dtm <- TermDocumentMatrix(df_corpus)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

# Wordcloud
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))


# Tabela de frequência
findFreqTerms(dtm, lowfreq = 4)
findAssocs(dtm, terms = "freedom", corlimit = 0.3)
head(d, 10)

# Gráficos de barras com as palavras mais frequentes
barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")
