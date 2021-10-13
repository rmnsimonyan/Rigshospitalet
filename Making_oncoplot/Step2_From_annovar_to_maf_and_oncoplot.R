# This script produces oncoplots for annovar files.
# We have the annotated annovar files in the folder called "3.annotated/"
# Run the code on the server if possible, it crushes locally when the number of samples is large (requires a lot of RAM).


#install.packages('R.utils')
library(R.utils)
library(maftools)

file_list <- list.files(path="3.annotated/")

var.annovar.maf <- annovarToMaf(annovar = paste("3.annotated/",file_list, sep=""), refBuild = 'hg38')

laml = read.maf(var.annovar.maf)


pdf(file = "summary.pdf", width = 8, height = 11) # defaults to 7 x 7 inches
plotmafSummary(maf = laml, rmOutlier = TRUE, addStat = 'median', dashboard = TRUE, titvRaw = FALSE)
dev.off()


pdf(file = "oncoplot10.pdf", width = 8, height = 11) # defaults to 7 x 7 inches
oncoplot(maf = laml, top = 10)
dev.off()

pdf(file = "oncoplot20.pdf", width = 8, height = 11) # defaults to 7 x 7 inches
oncoplot(maf = laml, top = 20)
dev.off()
