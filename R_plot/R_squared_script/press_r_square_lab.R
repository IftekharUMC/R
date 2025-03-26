#build and examine linear model
data1<-read.csv("data.csv", header=T)
colvar<-c("y","x")
fitmodel<-lm(formula = y~x, data = data1)
summary(fitmodel)
#stop and verify that that excel and lm() give you the same result

plot(fitmodel$resid ~data$Y[order(data$Y)], xlab="Y", ylab="Residuals")
hist(fitmodel$resid)
qqnorm(fitmodel$resid)
qqline(fitmodel$resid)


#LOOCV, learn about the forecast and the MPV packages for doing this
library("forecast")
g<-CV(fitmodel)
g


library("MPV")
g<-PRESS(fitmodel)
g