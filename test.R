rm(list=ls())
library('ape')
tree<-read.tree('CFML_new/SPN402.out.labelled_tree.newick') #your output tree from cfml
imports<-read.table('CFML_new/SPN402.out.importation_status.txt',h=T,as.is=T,sep="\t") #importation status output from cfml
files <- list.files(path="pops_new/", pattern=".txt") #populations defined from your metadata files
for(k in 1:length(files))
		{
			x <- read.table(paste0("pops_new/",files[k]))
			y <- as.vector(t(x))
			clade=list()
			#subtree=keep.tip(tree,y)
  			subtree<-drop.tip(tree,tree$tip.label[-match(y, tree$tip.label)],collapse.singles=F)
  			rec<-0
  			for (i in 1:nrow(imports)) 
  				rec<-rec+sum(substr(subtree$tip.label,2,nchar(subtree$tip.label)-1)==imports[i,1])+sum(subtree$node.label==imports[i,1])
  				#rec<-rec+sum(subtree$tip.label==imports[i,1])+sum(subtree$node.label==imports[i,1])
  				cat(files[k],'Num events=',rec,'Sum Branch Lengths=',sum(subtree$edge.length),'rho/theta=',rec/sum(subtree$edge.length)/1445787,
      '95%CI=',qgamma(c(0.025,0.975),rec,sum(subtree$edge.length)*1445787),'\n',file="new_data.txt",append=T,sep="\t")
    for (i in 1:nrow(imports)){
      if (sum(substr(subtree$tip.label,2,nchar(subtree$tip.label)-1)==imports[i,1]))
  			#if (sum(subtree$tip.label==imports[i,1]))
  			{
  				write.table(imports[i,], paste0("subtree_importation_status_",k,".txt"), append=TRUE, sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
  			}  else if (sum(subtree$node.label==imports[i,1]))
  			 {
  				 write.table(imports[i,], paste0("subtree_importation_status_",k,".txt"), append=TRUE, sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
  			 } 
  			}		
      }
		

