# Build Phylogenetic tree
library(ggtree)
library(ggimage)
library(phytools)


my_tree <- read.tree("tree.nwk")
info <- read.csv("mlst.csv") 
my_tree<- groupClade(my_tree, node=c(76,91,98))
p <- ggtree(my_tree + aes(color=node, linetype=node)
#            layout = "fan", branch.length = "none" %<+% info
p
p1<- p + geom_text(aes(label= LEGENDS, angle = angle, color= LEGENDS), hjust=-.1, na.rm = T)
p1
p2 <- p1 +  
  theme(legend.position = c(1.2,0.5)) + theme(plot.title = element_text(size = 15, face = "bold"), legend.title=element_text(size=15, face = "bold"), legend.text=element_text(size=15)) + scale_size_continuous(range = c(1, 5))
p2
