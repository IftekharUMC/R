# call library
library(pegas)

# pull data
data <- read.dna("GPSC37_before_rewrapped.fasta", "fasta")
pi_overall <- nuc.div(data, variance = TRUE)
pi_overall
cat(pi_overall,'\n', file="GPSC37_before_pi.txt", append=T, sep = "\t")

