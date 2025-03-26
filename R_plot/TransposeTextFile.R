data<-read.table("genotype.txt", row.names=1, header=TRUE)
transposed<-t(data)
write.table(transposed, file="transposed_table.txt", row.names=TRUE, col.names=NA)