# call library
library(pegas)

# pull data
data <- read.dna("sequence.out", "fasta")
pi_overall <- nuc.div(data, variance = TRUE)
pi_overall

#### sub population 
files <- list.files(path="/Users/iftekhar/Desktop/AllSet_Pathogen_watch/CFML/PHYML_TREE/pops/", pattern=".txt")
for(k in 1:length(files))
{
  x <- read.table(paste0("pops/",files[k]))
  y <- as.vector(t(x))
  subpop=list()
  pi<-nuc.div(subpop, variance = TRUE)
  cat(files[k], 'pi=', 'variance=','\n',file="data.txt",append=T,sep="\t")
}