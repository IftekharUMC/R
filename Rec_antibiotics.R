library(ggplot2)
X<-read.csv("Rec_antibiotics.csv",header=T, sep =",")
#lock order
X$Antibiotics <- factor(X$Antibiotics, levels = unique(X$Antibiotics), ordered = TRUE)
X$Susceptibility <- factor(X$Susceptibility, levels = unique(X$Susceptibility), ordered = TRUE)

# bar plot
p<- ggplot(X, aes(x=Antibiotics, y=RecRate, fill=Susceptibility)) + 
  geom_bar(stat="identity", color="black", width=0.8,
           position=position_dodge()) +
  geom_errorbar(aes(ymin=Lower, ymax=Upper), width=.5,
               position=position_dodge(0.8)) 

p1<- p+labs(title="Recombination rate comparison between antibiotic resistant and susceptible populations", x="Antibiotics", y = "Rho/Theta")+
  theme_classic() +
  scale_fill_manual(values=c('Red','Cyan'))
p2<- p1 + theme(axis.text.x = element_text(angle = 0, vjust = 0, hjust=0.5,size=20),
                axis.text.y = element_text(size = 20))
p3<- p2 + theme(plot.title = element_text(hjust = 0.5,size=20))
p4<- p3 + theme(axis.title = element_text(size=20))
p5<- p4 + theme(legend.title = element_text(size=15),legend.text = element_text(size = 15))
p5