# This script reads vcf files and creates an SNP table. It works extremely slowly for large datasets, so it is adviced to perform only the SNP extraction step
# step with this pipeline, save separate SNP tables for each sample/vcf, and refer to the python script in the same directory for SNP tables' merging.

library(VariantAnnotation)
library(dplyr)
library(gdata)
library(data.table)

# Function to add new entries to the table
addtotable <- function(bigmat, newvcf) {
  vcf <- readVcf(newvcf)
  res <- genotypeToSnpMatrix(vcf)
  mat = na.omit(t(as(res$genotype, "numeric")))
  name = colnames(mat)
  mat = as.matrix(mat[!duplicated(rownames(mat)),])
  colnames(mat) = name
  if(substring(rownames(mat)[1],1,3) == "chr"){
    rownames(mat) = substring(rownames(mat), 4)}
  
  mat = merge(bigmat,mat,by="row.names",all=TRUE)
  rownames(mat) = mat[,1]
  mat = mat[,-1]
  
  return(mat)
}

# Read the table with the names/addresses of vcf files
vcflist = read.table("tableofvcfilenames.txt")

snptable = matrix()

for(i in vcflist$V1){
  a = addtotable(snptable, i)
} 

snptable = snptable[-1,-1]

write.csv(snptable, file ="snptable.csv")

