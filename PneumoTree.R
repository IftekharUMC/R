library(tidyverse)
library(ggtree)
library(ggnewscale)

# read tree
tree <- read.tree("SPN415.out.labelled_tree.newick")
tree
p1 <- ggtree(tree, layout = "circular") + geom_tiplab(align = TRUE, cex = 0.5, linesize = 0.1)
p1
# read data
data<- read.csv("SPN_415_meta.csv", header = TRUE, sep = ",")
p2<- p1 %<+% data
p2
p3<- p1 + geom_facet(panel = 'Recombination', data = data$re, geom = geom_bar, 
                     mapping = aes(x = value, fill = as.factor(variable)), 
                     orientation = 'y', width = 0.8, stat='identity') + xlim_tree(9)
p3
####
