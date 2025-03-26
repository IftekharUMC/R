# Build Phylogenetic tree
library(ggtree)
library(ggimage)


my_tree <- read.tree("tree.nwk")
info <- read.csv("mlst.csv")

p <- ggtree(my_tree, layout = "rectangular", right = FALSE) %<+% info + xlim(-1, 1)
p2 <- p + geom_tiplab(offset = 10, hjust = 0.05) + geom_treescale(width = 5, color = "black", fontsize = 15) +
  geom_tippoint(aes(color = LEGENDS, size = 3)) + 
  ggtitle("Phylogenetic tree") + 
  theme(legend.position = c(0.8,0.7)) + theme(plot.title = element_text(size = 15, face = "bold"), legend.title=element_text(size=15, face = "bold"), legend.text=element_text(size=15)) + scale_size_continuous(range = c(1, 5))
p2
