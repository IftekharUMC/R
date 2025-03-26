#use R basicstats p.adjust fxn to convert p to q
data <- read.table("infile.txt", header=1)
qvalues <-p.adjust(data$p_lrt, method="fdr")
write(qvalues, file="qvalues1.txt", ncolumns=1)