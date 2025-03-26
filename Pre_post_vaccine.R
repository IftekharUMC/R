rm(list=ls())
library('ggplot2')
# read data
X <- read.csv('Pre_post_vaccine.csv',h=T,sep=",")
# lock in factor level order
X$Periods <- factor(X$Periods, levels = unique(X$Periods), ordered = TRUE)
# Pre vaccine period (Interleaved histograms)
p<-ggplot(X, aes(x=Frequency,fill=Periods, color=Periods)) +
  geom_histogram(fill='gray',position="identity",alpha=0.05)+
  theme(legend.position="top")
p
p1<- p+labs(title="Distribution of accessory genes frequency in pre- and post-vaccine periods", x="Frequency", y = "Count")+
  theme_classic() +
  scale_fill_manual(values=c('Red','Blue','Gray'))
p2<- p1 + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1,size=20),
                axis.text.y = element_text(size = 20))
p3<- p2 + theme(plot.title = element_text(hjust = 0.5,size=20))
p4<- p3 + theme(axis.title = element_text(size=20))
p5<- p4 + theme(legend.position = c(0.9,0.75),legend.title = element_text(size=15),legend.text = element_text(size = 15))
p5