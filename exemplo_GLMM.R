
# Modelo Linear Generalizado Misto - GLMM --------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 22/01/24 ---------------------------------------------------------------------------------------------------------------------------

# Introdução -------------------------------------------------------------------------------------------------------------------------------

### O Modelo Linear Generalizado Misto (Mixed Effects Generalized Linear Model 
### - GLMM) é uma extensão do Modelo Linear Generalizado (GLM) que incorpora 
### a capacidade de lidar com dados correlacionados ou hierárquicos. Ele é 
### particularmente útil quando os dados apresentam estrutura de agrupamento, 
### como observações repetidas em indivíduos, medidas repetidas em unidades 
### experimentais ou dados organizados em clusters.

### A principal diferença entre um GLM e um GLMM está na inclusão de efeitos 
### aleatórios, que capturam a variabilidade não explicada pelos preditores 
### fixos.

### Os efeitos aleatórios são usados para modelar as correlações entre as 
### observações dentro dos grupos, permitindo uma consideração mais realista 
### da estrutura dos dados.

# Análises ---------------------------------------------------------------------------------------------------------------------------------

### Para ajustar uma análise GLMM, necessitamos utilizar o pacote 'lme4'.

# Instale o pacote se ainda não estiver instalado
# install.packages("lme4")

# Carregue o pacote

library(lme4)

# Gere dados de exemplo

set.seed(123)
n_individuals <- 50
n_measurements <- 5

data <- expand.grid(Individual = 1:n_individuals, Time = 1:n_measurements)

View(data)

data$Outcome <- rbinom(n_individuals * n_measurements, size = 1, prob = 0.3)
data$Covariate <- rnorm(n_individuals * n_measurements)

# Ajuste do GLMM

glmm_model <- glmer(Outcome ~ Covariate + (1|Individual), 
                    data = data, family = binomial)

# Visualize os resultados

summary(glmm_model)

# Segundo exemplo --------------------------------------------------------------------------------------------------------------------------

# Gere dados de exemplo

set.seed(123)
n_parcelas <- 155
n_tratamentos <- 5
n_tempo <- 6

data <- expand.grid(Parcela = 1:n_parcelas, Tratamento = 1:n_tratamentos, Tempo = 1:n_tempo)
data$Diversidade <- rep(c(1, 2, 4, 8, 16), each = n_parcelas * n_tempo / n_tratamentos)
data$Invasora <- rbinom(n_parcelas * n_tratamentos * n_tempo, size = 1, prob = 0.2)
data$Tempo <- rep(1:n_tempo, each = n_parcelas * n_tratamentos)

View(data)

# Simulando dados de cobertura de espécies herbáceas como resposta

data$CoberturaHerbaceas <- rnorm(n_parcelas * n_tratamentos * n_tempo, 
                                 mean = 50, sd = 10)

View(data)

# Ajuste do GLMM

glmm_model <- glmer(CoberturaHerbaceas ~ Diversidade + Invasora + 
                      Tempo + (1|Parcela), 
                      data = data)

# Visualize os resultados

summary(glmm_model)

# Significância do modelo GLMM -------------------------------------------------------------------------------------------------------------

# Instale o pacote se ainda não estiver instalado
# install.packages("lmerTest")

# Carregue o pacote

library(lmerTest)

# Ajuste do GLMM com a diversidade, espécie invasora e tempo

glmm_model <- glmer(CoberturaHerbaceas ~ Diversidade + Invasora + Tempo + (1|Parcela), data = data, family = gaussian)

# Teste de Wald para obter p-valores

wald_test <- summary(glmm_model)$coefficients
wald_test

