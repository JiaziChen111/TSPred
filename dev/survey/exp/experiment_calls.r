#Pacotes necessarios para funcoes em fittest_models_functions
#install.packages(c("TSPred","KFAS","car","forecast","wavelets","EMD","vars"))
#Pacotes necessarios para funcoes em stats_properties_functions
#install.packages(c("urca","tseries","stats","lmtest","car","nortest","plyr"))
#Pacotes necessarios para funcoes em results_analysis_functions
#install.packages(c("TSPred","KFAS","MuMIn","openair","ggplot2","corrplot"))
#devtools::install_github("vsimko/corrplot")

library("TSPred")

data("NN3.A","NN3.A.cont")
#Statistical properties across all series
statprop_NN3 <- TSstats(NN3.A)
View(statprop_NN3)
#Analysis of fittness and prediction of many series and taylor diagram generation
results_NN3 <- TransformsExp(NN3.A,NN3.A.cont,rank.by="MSE")
#overall statistics across all series for each metric: transf X transf (all series must be positive(negative))
#p.adjust.method=c("holm", "hochberg", "hommel", "bonferroni", "BH" <- , "BY","fdr", "none")
stats_NN3 <- TransformsExpStats(results_NN3$results,"none")
View(stats_NN3$MSE)
#plot taylor diagrams for the transforms predictions of the series
TaylorDiag_NN3 <- plotTaylorDiagrams(results_NN3$results,NN3.A.cont)
#plot barplot with the number of times each transform was in the top 5 results of the series
plotwins_NN3 <- plotTransformWins(results_NN3$results,top=5)$plot
plotwins_NN3$plot
#plot barplot with the number of times each transform had errors "statistically" smaller than other transform
plotwinsStats_NN3 <- plotTransformWinsStats(stats_NN3)
plotwinsStats_NN3$plots$errors
plotwinsStats_NN3$plots$fitness
plotwinsStats_NN3$plots$TSPredC
#Plot and save "correlograms" with the p-values resulting from resultsExpStats
plotTransformStats(stats_NN3)


data("NN5.A","NN5.A.cont")
#Statistical properties across all series
statprop_NN5 <- TSstats(NN5.A)
View(statprop_NN5)
#Analysis of fittness and prediction of many series and taylor diagram generation
results_NN5 <- TransformsExp(NN5.A,NN5.A.cont,rank.by="MSE")
#overall statistics across all series for each metric: transf X transf (all series must be positive(negative))
#p.adjust.method=c("holm", "hochberg", "hommel", "bonferroni", "BH" <- , "BY","fdr", "none")
stats_NN5 <- TransformsExpStats(results_NN5$results,"none")
View(stats_NN5$MSE)
#plot taylor diagrams for the transforms predictions of the series
TaylorDiag_NN5 <- plotTaylorDiagrams(results_NN5$results,NN5.A.cont)
#plot barplot with the number of times each transform was in the top 5 results of the series
plotwins_NN5 <- plotTransformWins(results_NN5$results,top=5)$plot
plotwins_NN5$plot
#plot barplot with the number of times each transform had errors "statistically" smaller than other transform
plotwinsStats_NN5 <- plotTransformWinsStats(stats_NN5)
plotwinsStats_NN5$plots$errors
plotwinsStats_NN5$plots$fitness
plotwinsStats_NN5$plots$TSPredC
#Plot "correlogram" with the p-values resulting from resultsExpStats
plotTransformStats(stats_NN5)


data("CATS","CATS.cont")
#Statistical properties across all series
statprop_CATS <- TSstats(CATS)
View(statprop_CATS)
#Analysis of fittness and prediction of many series and taylor diagram generation
results_CATS <- TransformsExp(CATS,CATS.cont,rank.by="MSE")
#overall statistics across all series for each metric: transf X transf (all series must be positive(negative))
#p.adjust.method=c("holm", "hochberg", "hommel", "bonferroni", "BH" <- , "BY","fdr", "none")
stats_CATS <- TransformsExpStats(results_CATS$results,"none")
View(stats_CATS$MSE)
#plot taylor diagrams for the transforms predictions of the series
TaylorDiag_CATS <- plotTaylorDiagrams(results_CATS$results,CATS.cont)
#plot barplot with the number of times each transform was in the top 5 results of the series
plotwins_CATS <- plotTransformWins(results_CATS$results,top=5)$plot
plotwins_CATS$plot
#plot barplot with the number of times each transform had errors "statistically" smaller than other transform
plotwinsStats_CATS <- plotTransformWinsStats(stats_CATS)
plotwinsStats_CATS$plots$errors
plotwinsStats_CATS$plots$fitness
plotwinsStats_CATS$plots$TSPredC
#Plot "correlogram" with the p-values resulting from resultsExpStats
plotTransformStats(stats_CATS)


#Prepare Ipeadata datasets (ipeadata_d,ipeadata_d.cont, ipeadata_m,ipeadata_m.cont)
library(readr)
ipeadata_d <- read_delim("C:/Users/Rebecca/Desktop/ipeadata_mostused_daily.csv", 
                         ";", escape_double = FALSE, col_types = cols(Data = col_skip(), 
                                                                      `EMBI + Risco-Brasil - - - JP Morgan - JPM366_EMBI366` = col_double(), 
                                                                      `Exporta��es - m�dia semanal - US$ - Minist�rio do Desenvolvimento, Ind�stria e Com�rcio Exterior, Secretaria de Com�rcio Exterior - SECEX366_XVTOT366` = col_double(), 
                                                                      `Importa��es - m�dia semanal - US$ - Minist�rio do Desenvolvimento, Ind�stria e Com�rcio Exterior, Secretaria de Com�rcio Exterior - SECEX366_MVTOT366` = col_double(), 
                                                                      `Taxa de c�mbio - R$ / US$ - comercial - compra - m�dia - R$ - Banco Central do Brasil, Sistema Gerenciador de S�ries Temporais (Bacen Outras/SGS) - GM366_ERC366` = col_double(), 
                                                                      `Taxa de c�mbio - R$ / US$ - comercial - venda - m�dia - R$ - Banco Central do Brasil, Sistema Gerenciador de S�ries Temporais (Bacen Outras/SGS) - GM366_ERV366` = col_double(), 
                                                                      `Taxa de c�mbio - R$ / US$ - paralelo - venda - m�dia - R$ - Valor Econ�mico - GM366_ERPV366` = col_double(), 
                                                                      `Taxa de juros - Over / Selic - (% a.a.) - Banco Central do Brasil, Sistema Gerenciador de S�ries Temporais (Bacen Outras/SGS) - GM366_TJOVER366` = col_double(), 
                                                                      `Taxa de juros - Over / Selic - volatilidade - - - Instituto de Pesquisa Econ�mica Aplicada (IPEA) - GM366_TJOVERV366` = col_double(), 
                                                                      `Taxa de juros - Selic - fixada pelo Copom - (% a.a.) - Banco Central do Brasil, Boletim, Se��o mercado financeiro e de capitais (Bacen/Boletim/M. Finan.) - BM366_TJOVER366` = col_double(), 
                                                                      `Taxa de juros - TR - (% a.m.) - Banco Central do Brasil, Sistema Gerenciador de S�ries Temporais (Bacen Outras/SGS) - GM366_TJTR366` = col_double(), 
                                                                      `Zona do Euro - taxa de c�mbio - euro / US$ - m�dia - Euro - Banco Central do Brasil, Sistema Gerenciador de S�ries Temporais (Bacen Outras/SGS) - GM366_EREURO366` = col_double(), 
                                                                      `�ndice de a��es - Ibovespa - fechamento - - - Bolsa de Valores, Mercadorias e Futuros (BM&FBovespa) - GM366_IBVSP366` = col_double()), 
                         locale = locale(decimal_mark = ",", grouping_mark = "."), 
                         trim_ws = TRUE)
ipeadata_m <- read_delim("C:/Users/Rebecca/Desktop/ipeadata_mostused_monthly.csv", 
                         ";", escape_double = FALSE, col_types = cols(Data = col_skip(), 
                                                                      `Exporta��es - pre�os - �ndice (m�dia 2006 = 100) - - - Funda��o Centro de Estudos do Com�rcio Exterior (Funcex) - FUNCEX12_XPT12` = col_double(), 
                                                                      `IGP-DI - geral - �ndice (ago. 1994 = 100) - - - Funda��o Getulio Vargas, Conjuntura Econ�mica - IGP (FGV/Conj. Econ. - IGP) - IGP12_IGPDI12` = col_double(), 
                                                                      `IGP-M - geral - �ndice (ago. 1994 = 100) - - - Funda��o Getulio Vargas, Conjuntura Econ�mica - IGP (FGV/Conj. Econ. - IGP) - IGP12_IGPM12` = col_double(), 
                                                                      `INPC - geral - �ndice (dez. 1993 = 100) - - - Instituto Brasileiro de Geografia e Estat�stica, Sistema Nacional de �ndices de Pre�os ao Consumidor (IBGE/SNIPC) - PRECOS12_INPC12` = col_double(), 
                                                                      `IPCA - geral - �ndice (dez. 1993 = 100) - - - Instituto Brasileiro de Geografia e Estat�stica, Sistema Nacional de �ndices de Pre�os ao Consumidor (IBGE/SNIPC) - PRECOS12_IPCA12` = col_double(), 
                                                                      `Importa��es - pre�os - �ndice (m�dia 2006 = 100) - - - Funda��o Centro de Estudos do Com�rcio Exterior (Funcex) - FUNCEX12_MDPT12` = col_double(), 
                                                                      `Infla��o - IGP-DI - (% a.m.) - Funda��o Getulio Vargas, Conjuntura Econ�mica - IGP (FGV/Conj. Econ. - IGP) - IGP12_IGPDIG12` = col_double(), 
                                                                      `Infla��o - IGP-M - (% a.m.) - Funda��o Getulio Vargas, Conjuntura Econ�mica - IGP (FGV/Conj. Econ. - IGP) - IGP12_IGPMG12` = col_double(), 
                                                                      `Infla��o - IGP-OG - (% a.m.) - Funda��o Getulio Vargas, Conjuntura Econ�mica - IGP (FGV/Conj. Econ. - IGP) - IGP12_IGPOGG12` = col_double(), 
                                                                      `Infla��o - INPC - (% a.m.) - Instituto Brasileiro de Geografia e Estat�stica, Sistema Nacional de �ndices de Pre�os ao Consumidor (IBGE/SNIPC) - PRECOS12_INPCBR12` = col_double(), 
                                                                      `Infla��o - IPCA - (% a.m.) - Instituto Brasileiro de Geografia e Estat�stica, Sistema Nacional de �ndices de Pre�os ao Consumidor (IBGE/SNIPC) - PRECOS12_IPCAG12` = col_double(), 
                                                                      `Infla��o - IPCA-15 - (% a.m.) - Instituto Brasileiro de Geografia e Estat�stica, Sistema Nacional de �ndices de Pre�os ao Consumidor (IBGE/SNIPC) - PRECOS12_IPCA15G12` = col_double(), 
                                                                      `PIB - R$ - Banco Central do Brasil, Boletim, Se��o Atividade Econ�mica (Bacen / Boletim / Ativ. Ec.) - BM12_PIB12` = col_double(), 
                                                                      `Sal�rio m�nimo - R$ - Minist�rio do Trabalho e Emprego (MTE) - MTE12_SALMIN12` = col_double(), 
                                                                      `Sal�rio m�nimo real - R$ - Instituto de Pesquisa Econ�mica Aplicada (IPEA) - GAC12_SALMINRE12` = col_double(), 
                                                                      `Taxa de c�mbio - R$ / US$ - comercial - compra - m�dia - R$ - Banco Central do Brasil, Boletim, Se��o Balan�o de Pagamentos (Bacen / Boletim / BP) - BM12_ERC12` = col_double(), 
                                                                      `Taxa de c�mbio - R$ / US$ - comercial - venda - m�dia - R$ - Banco Central do Brasil, Boletim, Se��o Balan�o de Pagamentos (Bacen / Boletim / BP) - BM12_ERV12` = col_double(), 
                                                                      `Taxa de desemprego - RMSP - (%) - Funda��o Sistema Estadual de An�lise de Dados, Pesquisa de Emprego e Desemprego (Seade/PED) - SEADE12_TDTGSP12` = col_double(), 
                                                                      `Taxa de desemprego - aberto - RMSP - (%) - Funda��o Sistema Estadual de An�lise de Dados, Pesquisa de Emprego e Desemprego (Seade/PED) - SEADE12_TDAGSP12` = col_double(), 
                                                                      `Taxa de desemprego - oculto - RMSP - (%) - Funda��o Sistema Estadual de An�lise de Dados, Pesquisa de Emprego e Desemprego (Seade/PED) - SEADE12_TDOTSP12` = col_double(), 
                                                                      `Taxa de desemprego - oculto - prec�rio - RMSP - (%) - Funda��o Sistema Estadual de An�lise de Dados, Pesquisa de Emprego e Desemprego (Seade/PED) - SEADE12_TDOPSP12` = col_double(), 
                                                                      `Taxa de desemprego - refer�ncia: 30 dias - RMs - (%) - Instituto Brasileiro de Geografia e Estat�stica, Pesquisa Mensal de Emprego (IBGE/PME) - obs:  PME foi encerrada em mar�o de 2016, com a divulga��o dos resultados referentes ao m�s de fevereiro de 2016. - PMEN12_TD12` = col_double(), 
                                                                      `Taxa de juros - Over / Selic - (% a.m.) - Banco Central do Brasil, Boletim, Se��o mercado financeiro e de capitais (Bacen/Boletim/M. Finan.) - BM12_TJOVER12` = col_double()), 
                         locale = locale(decimal_mark = ",", grouping_mark = "."), 
                         trim_ws = TRUE)
n.ahead_d = 30
ipeadata_d.cont <- do.call(data.frame.na, lapply(ipeadata_d, function(x) tail(na.omit(x), n.ahead_d)) )
ipeadata_d <- do.call(data.frame.na, lapply(ipeadata_d, function(x) head(na.omit(x), length(na.omit(x))-n.ahead_d)) )
n.ahead_m = 12
ipeadata_m.cont <- do.call(data.frame.na, lapply(ipeadata_m, function(x) tail(na.omit(x), n.ahead_m)) )
ipeadata_m <- do.call(data.frame.na, lapply(ipeadata_m, function(x) head(na.omit(x), length(na.omit(x))-n.ahead_m)) )
#Statistical properties across all series
statprop_ipeadata_d <- TSstats(ipeadata_d)
View(statprop_ipeadata_d)
statprop_ipeadata_m <- TSstats(ipeadata_m)
View(statprop_ipeadata_m)
#Analysis of fittness and prediction of many series and taylor diagram generation
results_ipeadata_d <- TransformsExp(ipeadata_d,ipeadata_d.cont,rank.by="MSE")
results_ipeadata_m <- TransformsExp(ipeadata_m,ipeadata_m.cont,rank.by="MSE")
#overall statistics across all series for each metric: transf X transf (all series must be positive(negative))
#p.adjust.method=c("holm", "hochberg", "hommel", "bonferroni", "BH" <- , "BY","fdr", "none")
stats_ipeadata_d <- TransformsExpStats(results_ipeadata_d$results,"none")
View(stats_ipeadata_d$MSE)
stats_ipeadata_m <- TransformsExpStats(results_ipeadata_m$results,"none")
View(stats_ipeadata_m$MSE)
#plot taylor diagrams for the transforms predictions of the series
TaylorDiag_ipeadata_d <- plotTaylorDiagrams(results_ipeadata_d$results,ipeadata_d.cont)
#plot barplot with the number of times each transform was in the top 5 results of the series
plotwins_ipeadata_d <- plotTransformWins(results_ipeadata_d$results,top=5)$plot
plotwins_ipeadata_d$plot
#plot taylor diagrams for the transforms predictions of the series
TaylorDiag_ipeadata_m <- plotTaylorDiagrams(results_ipeadata_m$results,ipeadata_m.cont)
#plot barplot with the number of times each transform was in the top 5 results of the series
plotwins_ipeadata_m <- plotTransformWins(results_ipeadata_m$results,top=5)$plot
plotwins_ipeadata_m$plot
#plot barplot with the number of times each transform had errors "statistically" smaller than other transform
plotwinsStats_ipeadata_d <- plotTransformWinsStats(stats_ipeadata_d)
plotwinsStats_ipeadata_d$plots$errors
plotwinsStats_ipeadata_d$plots$fitness
plotwinsStats_ipeadata_d$plots$TSPredC
plotwinsStats_ipeadata_m <- plotTransformWinsStats(stats_ipeadata_m)
plotwinsStats_ipeadata_m$plots$errors
plotwinsStats_ipeadata_m$plots$fitness
plotwinsStats_ipeadata_m$plots$TSPredC
#Plot "correlogram" with the p-values resulting from resultsExpStats
plotTransformStats(stats_ipeadata_d)
plotTransformStats(stats_ipeadata_m)