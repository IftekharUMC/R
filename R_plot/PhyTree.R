# Build Phylogenetic tree
library(tidyverse)
library(ggtree)
library(treeio)

my_tree <- read.tree("tree.nwk")
# build a ggplot with a geom_tree
ggplot(my_tree) + geom_tree() + geom_treescale(x=10, width=1, color= "red",fontsize=6, linesize=2)
ggtree(my_tree)
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
       