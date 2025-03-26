
# Build Phylogenetic tree
library(ggtree)
library(ggimage)
library(phytools)
library(ggnewscale)
library(ggplot2)

tree <- read.tree("tree.nwk")
tree
circ <- ggtree(tree, layout = "circular")
circ

df <- data.frame(first=c("a", "b", "a", "c", "d", "d", "a", "b", "e", "e", "f", "c", "f"),
                 second= c("z", "z", "z", "z", "y", "y", "y", "y", "x", "x", "x", "a", "a"))
rownames(df) <- tree$tip.label

df2 <- as.data.frame(matrix(rnorm(39), ncol=3))
rownames(df2) <- tree$tip.label
colnames(df2) <- LETTERS[1:3]


p1 <- gheatmap(circ, df, offset=.8, width=.2,
               colnames_angle=95, colnames_offset_y = .25) +
  scale_fill_viridis_d(option="D", name="discrete\nvalue")

library(ggnewscale)
p2 <- p1 + new_scale_fill()
myplot <- gheatmap(p2, df2, offset=15, width=.3,
         colnames_angle=90, colnames_offset_y = .25) +
  scale_fill_viridis_c(option="A", name="continuous\nvalue")
myplot