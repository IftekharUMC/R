# Build Phylogenetic tree
library(ggtree)
library(ggimage)
library(phytools)


my_tree <- read.tree("tree.nwk")
info <- read.csv("mlst.csv")

p <- ggtree(my_tree, layout = "circular", branch.length = "roundBranches" ) %<+% info + xlim(-1, 1)
p1<- p + geom_text(aes(label= LEGENDS, angle = angle, color= LEGENDS), hjust=-.8, na.rm = T)
p1
p2 <- p1 +  
  theme(legend.position = c(0.8,0.7)) + theme(plot.title = element_text(size = 15, face = "bold"), legend.title=element_text(size=15, face = "bold"), legend.text=element_text(size=15)) + scale_size_continuous(range = c(1, 5))
p2
