
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