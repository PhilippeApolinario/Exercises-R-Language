# Calculando a média por disciplina
eng_computacao <- data.frame(aluno = c('Roberto', 'Paulo', 'Juliana', 'Rafaela',
                                       'Ricardo', 'Ana'),
                             algebra_linear = c(80, 90, 56, 67, 87, 76),
                             geometria_analitica = c(90, 78, 98, 67, 56, 89),
                             estrutura_dados = c(100, 90, 95, 87, 78, 80),
                             processamento_dados = c(90, 79, 85, 87, 90, 100))


# Variáveis categóricas ordinais
grad <- c("Doutorado", "Mestrado", "Bacharelado", "Mestrado", "Doutorado", 
          "Mestrado")
grad

factor_grad <- factor(grad, order = TRUE, 
                      levels = c("Doutorado", "Mestrado", "Bacharelado"))
factor_grad

# Observando os níveis da variável
levels(factor_grad)

# Visão geral do conteúdo da variável
summary(factor_grad)

# Substituindo a palavra mangueiras por bananeiras
poema <- c("Casas", "entre mangueiras", "Mulheres", 
         "entre laranjeiras", "Pomar",
         "amor",
         "cantar")

gsub("mangueiras", "bananeiras", poema)


# Função que converte vetores em data frame
vec1 <- (5:10)
vec2 <- c("Grande Sertão: Veredas", "Sagarana", "Dom Casmurro", 
          "Memórias Póstumas de Brás Cubas", "Vidas Secas", "Capitães da Areia")

# Verificando os níveis do fator.
levels(vec2)

convert <- function(x, y){
  df = data.frame(cbind(x, y))
  print(df)
}

convert(vec1, vec2)

# Calcula a soma dos elementos da lista
lista <- list(a = 5:10, b = 15:20)
lista
do.call(sum, lista)

# Transformando lista em vetor
unlist(lista)

# Calculando a media de cada linha da matriz
matriz <- matrix(c(1:25), nrow = 5, ncol = 5)
matriz
apply(matriz, 1, mean)


# Gráfico de dispersão (scatter plot) usando ggplot2
library(ggplot2)

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + 
  geom_point() +
  labs(title = "Gráfico de Dispersão - Comprimento vs. Largura da Sépala",
       x = "Comprimento da Sépala",
       y = "Largura da Sépala",
       color = "Espécies")

# Criando o boxplot usando ggplot2
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot - Comprimento da Sépala por Espécie",
       x = "Espécies",
       y = "Comprimento da Sépala")

# Criando histograma utilizando ggplot2
histogram <- ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(binwidth = 0.2, color = "black", alpha = 0.7) +
  scale_fill_manual(values = c("#E69F00", "#56B4E9", "#009E73")) +
  labs(title = "Histograma do Comprimento da Sépala por Espécie",
       x = "Comprimento da Sépala",
       y = "Contagem") +
  theme_minimal()

print(histogram)

# Criando gráfico usando xyplot
library(lattice)

xyplot(Sepal.Width ~ Sepal.Length, data = iris, groups = Species,            
       col = c("blue", "green", "red"),  
       pch = c(16, 17, 18),         
       cex = 1.5,                   
       key = list(title = "Species",      
       lines = TRUE,       
       text = list(levels(iris$Species), 
       col = c("blue", "green", "red"), cex = 1.2)))