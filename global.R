library(shiny)
library(AppliedPredictiveModeling)
library(ggplot2)
library(PerformanceAnalytics)
library(lattice)
data(concrete)
df <- concrete
pNames <- colnames(df)[1:ncol(df)-1]
outcome <- colnames(df)[ncol(df)]
allNames <- colnames(df)
