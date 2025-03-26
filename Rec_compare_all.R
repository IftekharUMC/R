library(ggplot2)
X<-read.csv("Rec_compare_all.csv",header=T, sep =",")
# lock in factor level order
X$Periods <- factor(X$Periods, levels = unique(X$Periods), ordered = TRUE)
# bar plot
p<- ggplot(X, aes(x=Periods, y=RecRate, fill=Periods)) + 
  geom_bar(stat="identity", color="black", width=0.8,
           position=position_dodge()) +
  geom_errorbar(aes(ymin=Lower, ymax=Upper), width=.5,
               position=position_dodge(0.8)) 

p1<- p+labs(title="Recombination rate in different periods", x="Periods", y = "Rho/Theta")+
  theme_classic() +
  scale_fill_manual(values=c('Red','Blue','Green', 'Cyan','Magenta','Orange','Gray'))
p2<- p1 + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1,size=20),
                axis.text.y = element_text(size = 20))
p3<- p2 + theme(plot.title = element_text(hjust = 0.5,size=20))
p4<- p3 + theme(axis.title = element_text(size=20))
p5<- p4 + theme(legend.position = "none")
p5