#put your scores in column1, phenotype in column2, label columns as x and y (lowercase), save as csv

#install.packages("cvq2")
library("cvq2")

data<-read.csv("st2.csv", header=T)
result<-cvq2(data,y~x)

#verify that r^2 is the same as what you had previously, and enter the q^2 into the abstract as the predictive r^2 instead of the "error"