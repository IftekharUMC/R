# Build Phylogenetic tree
library(ggtree)
library(ggimage)
library(phytools)


my_tree <- read.tree("tree.nwk")
info <- read.csv("mlst.csv") 

p<-ggtree(my_tree,layout = "fan", branch.length = "none")  %<+% info
p1<-p+ geom_hilight(node=c(57), fill='steelblue', alpha=0.6) +
       geom_hilight(node=c(76), fill='#999999', alpha=0.6) +
       geom_hilight(node=91, fill='darkgreen', alpha=0.6) +
       geom_hilight(node=98, fill='darkred', alpha=0.6)
       #geom_balance(node=58, fill='pink', color='white', alpha=0.6, extend=1)
p2<- p1 + geom_text(aes(label= LEGENDS, angle = angle, color=LEGENDS), hjust=-.1, na.rm = T)
p2
