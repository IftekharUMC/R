####
# call ggplot2
library(ggplot2)
library(plyr)


#call data Pt1
dat <- PI
fill <- "white"
line <-"black"
bplot <-ggplot(dat, aes(x=Phenotype, y=Weight_01))+geom_boxplot(fill=fill, colour=line ) +
     scale_x_discrete(name = "Phenotype") + scale_y_continuous(name ="Weight_01",breaks = seq(-175, 175, 50),limits =c(-200,200))+geom_jitter()+theme_classic()+ggtitle("Genome-Wide Polygenic Score (GPS)")

bplot