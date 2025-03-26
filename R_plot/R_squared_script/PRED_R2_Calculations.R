#build and examine linear model
data1<-read.csv("data.csv", header=T)
colvar<-c("y","x")

x = data1$x
y = data1$y

fit<-lm(formula = y~x, data = data1)
summary(fit)


yi = y
yi_yihat = fit$residuals

inf = lm.influence(fit)

one_hat = 1 - inf$hat


PRESS = sum(yi_yihat^2/one_hat^2)
# PRESS

anova_ss = anova(fit)


tot_ss = anova_ss$`Sum Sq`[1] + anova_ss$`Sum Sq`[2]
tot_ss


PRE_R2 = 1 - (PRESS/tot_ss) 

PRE_R2

