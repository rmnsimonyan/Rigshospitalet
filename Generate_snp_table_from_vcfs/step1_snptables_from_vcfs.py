library(VariantAnnotation)
library(dplyr)
library(gdata)
library(data.table)
library(foreach)
library(doParallel)

zz <- file("Errors.txt", open="wt")
sink(zz, type="message")

zz1 <- file("console.txt", open="wt")
sink(zz1,  split=TRUE)


addtotable <- function(newvcf) {
  print(c)
  vcf <- readVcf(paste("/ngc/people/armsim/hierarchies/filetype/variants/snv/", newvcf, sep = ""))
  res <- genotypeToSnpMatrix(vcf)
  mat = na.omit(t(as(res$genotype, "numeric")))
  name = colnames(mat)
  mat = as.matrix(mat[!duplicated(rownames(mat)),])
  colnames(mat) = name
  if(substring(rownames(mat)[1],1,3) == "chr"){
    rownames(mat) = substring(rownames(mat), 4)}

#  mat = merge(bigmat,mat,by="row.names",all=TRUE)
#  rownames(mat) = mat[,1]
#  mat = mat[,-1]

  return(mat)
}

vcflist = read.table("out2.log")

#snptable = matrix()
c = 0

for (i in vcflist$V1){
  c = c+1
  tryCatch({
  snptable = addtotable(i)
  }, error=function(e){cat("ERROR :",conditionMessage(e), "\n")})
  write.csv(snptable, file=paste("tables_trial2/",i, ".csv", sep=""))
}
