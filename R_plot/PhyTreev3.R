# Build Phylogenetic tree
library(ggtree)
library(ggimage)


my_tree <- read.tree("tree.nwk")
info <- read.csv("mlst.csv")

p <- ggtree(my_tree, layout = "circular") %<+% info + xlim(-1, 1)
p2 <- p + geom_tiplab2(offset = 5, hjust = 0.05) +
  geom_tippoint(aes(color = ST, size = 5)) + ggtitle("Phylogenetic tree") + 
  theme(legend.position = "right") + theme(plot.title = element_text(size = 15, face = "bold"), legend.title=element_text(size=15, face = "bold"), legend.text=element_text(size=15)) + scale_size_continuous(range = c(1, 5))
p2
