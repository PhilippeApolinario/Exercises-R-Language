# Temperatura Média em Cidades Brasileiras

# Dataset:
# https://www.kaggle.com/datasets/berkeleyearth/climate-change-earth-surface-temperature-data


# Instalando e Carregando Pacotes
library(readr)
library(dplyr)
library(ggplot2)
library(readr)
library(scales)
library(data.table)


# Carregando os dados 
# (Comparando o tempo de carregamento)

# Desempenho do read.table()
system.time(df2 <- read.table("GlobalLandTemperaturesByCity.csv"))

# Desempenho do read.csv2()
system.time(df1 <- read.csv2("GlobalLandTemperaturesByCity.csv"))

# Desempenho do fread()
system.time(df3 <- fread("GlobalLandTemperaturesByCity.csv"))


# Criando subsets dos dados
cidades_brasil <- subset(df3, Country == 'Brazil')

# Removendo os valores Ausentes
cidades_brasil <- na.omit(cidades_brasil)

# Amostra de dados
head(cidades_brasil)

# Número de registros do dataframe original
nrow(df3)

# Número de registros das cidades brasileiras
nrow(cidades_brasil)

# Dimensão
dim(cidades_brasil)


# Tratando os dados

# Convertendo as Datas

# Preparando o formato de saída das datas
cidades_brasil$dt <- as.POSIXct(cidades_brasil$dt,format='%Y-%m-%d')

# Separando por mês
cidades_brasil$Month <- month(cidades_brasil$dt)

# Separando por ano
cidades_brasil$Year <- year(cidades_brasil$dt)


# Criando subsets

# Rio de Janeiro
rj <- subset(cidades_brasil, City == 'Rio De Janeiro')
rj <- subset(rj, Year %in% c(1850,1955,1994,2000,2010,2012))

# Recife
recf <- subset(cidades_brasil, City == 'Recife')
recf <- subset(recf, Year %in% c(1850,1955,1994,2000,2010,2012))

# Rio Grande do Sul
rs <- subset(cidades_brasil, City == 'Rio Grande Do Sul')
rs <- subset(rs, Year %in% c(1850,1955,1994,2000,2010,2012))


# Construção dos plots
plot_rj <- ggplot(rj, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, linewidth = 2) +
  theme_light(base_size = 20) +
  xlab("Mês")+
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Rio de Janeiro") +
  theme(plot.title = element_text(size = 18))

plot_recf <- ggplot(recf, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, linewidth = 2) +
  theme_light(base_size = 20) +
  xlab("Mês")+
  ylab("Temperatura") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Recife") +
  theme(plot.title = element_text(size = 18))

plot_rs <- ggplot(rs, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, linewidth = 2) +
  theme_light(base_size = 20) +
  xlab("Mês")+
  ylab("Temperatura") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Rio Grande do Sul") +
  theme(plot.title = element_text(size = 18))


# Plots
plot_rj
plot_recf
plot_rs
