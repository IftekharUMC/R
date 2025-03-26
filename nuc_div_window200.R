library(ggplot2)
mydata=read.table("window200-pi.windowed.pi.txt", header=T, row.names=NULL, sep="\t")
myrev99=quantile(mydata$Pi, probs=c(0.99), na.rm=T)
p1 <-ggplot(mydata, aes(MidPoint, Pi)) + geom_point() + theme_classic() +
     xlab("Alignment Coordinate") + ylab("Nucleotide diversity per window of 200bp (pi)") + 
     geom_hline(yintercept=myrev99, color="red")
p1
