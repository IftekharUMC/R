# Build Phylogenetic tree
library(tidyverse)
library(ggtree)
library(treeio)
library(ggimage)

my_tree <- read.tree("tree.nwk")
info <- read.csv("mlst.csv")


# build a ggplot with a geom_tree


p <- ggtree(my_tree, branch.length = "none", linetype=1, layout = "fan") %<+% info + xlim(-1, 0.5)
p2 <- p + geom_tiplab(offset = 5, hjust = .5) +
  geom_tippoint(aes(color = mlst)) + 
  theme(legend.position = "right") + scale_size_continuous(range = c(1, 5))
p2

# add a scale
# ggtree(my_tree) + geom_treescale()
# or add the entire scale to the x axis with theme_tree2()
# ggtree(my_tree) + theme_tree2()
# produce cladogram
p <- ggtree(my_tree, branch.length = "none", color="black", size=0.5, linetype=1, layout = "fan")
p
# Label the tips
#p1 <- p + ggtitle("Phylogenetic tree") + geom_nodepoint(size = 3, color = "blue") + geom_tippoint(size = 0)
p1 <- p + geom_tiplab(align=TRUE, hjust = 0.05, linesize= 1, color = "black") +ggtitle("Phylogenetic tree") +
   geom_nodepoint(size = 3, color = "blue") + geom_tippoint(size = 0)
p1


# base::cbind(p=p1, mlst = "~/../Applications/pGWAS/5thPhase_Sepi/fastas/mlst.csv", window = c(100, 100)  )
msaplot(p= p1, fasta = "~/../Applications/pGWAS/5thPhase_Sepi/fastas/mlst.csv", window = c(100, 150) )
       