library(ggplot2)
mydata=read.table("nuc_div_persite.txt", header=T, row.names=NULL, sep="\t")
myrev99=quantile(mydata$Pi, probs=c(0.99), na.rm=T)
p1 <-ggplot(mydata, aes(CoreAlignment, Pi)) + geom_point() + theme_classic() +
     xlab("Alignment Coordinate") + ylab("Nucleotide diversity per site (pi)") + 
     geom_hline(yintercept=myrev99, color="red")
p1
