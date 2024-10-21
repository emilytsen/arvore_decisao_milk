dados = read.csv('milknew.csv')
dados

df$Odor

#instalar e carregar os pacotes
install.packages("rpart")
install.packages("rpart.plot")
install.packages("caret")

library(rpart)
library(rpart.plot)
library(caret)

# Transformar a variável no alvo
dados$Grade <- as.factor(dados$Grade)

#definir uma semente
set.seed(123)

#70% para treino e 30% para teste
indice_treino <- sample(1:nrow(dados), 0.7 * nrow(dados))

treino <- dados[indice_treino, ]
teste <- dados[-indice_treino, ]

#criar modelo
modelo <- rpart(Grade ~ ., data = treino, method = "class")

#ver árvore
rpart.plot(modelo, extra = 106)

#prever teste
previsoes <- predict(modelo, teste, type = "class")

# Criar a matriz de confusão para avaliar o modelo
matriz_confusao <- confusionMatrix(previsoes, teste$Grade)
print(matriz_confusao)

#matriz de confusão
matriz_confusao <- confusionMatrix(previsoes, teste$Grade)
print(matriz_confusao)