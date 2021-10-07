#Converting all the samples from vcf to annovar
for FILE in *; do /ngc/projects/gm_ext/armsim/datamove_29072021/workdir/PR080/vcftomaf/annovar/convert2annovar.pl -format vcf4 $FILE > /ngc/projects/gm_ext/armsim/datamove_29072021/workdir/PR080/vcftomaf/trial4/annovarformat/${FILE::17}.avinput ; done

#Running the annotation
# !IMPORTANT - remember to download corresponding reference files and save them in ~/annovar/humandb/ folder before runnning the annotation. We run here for hg38 genome.

for FILE in /ngc/projects/gm_ext/armsim/datamove_29072021/workdir/PR080/vcftomaf/trial4/annovarformat/*; do perl /ngc/projects/gm_ext/armsim/datamove_29072021/workdir/PR080/vcftomaf/annovar/table_annovar.pl $FILE humandb/ -buildver hg38 -out myanno -remove -protocol refGene,cytoBand,exac03,avsnp147,dbnsfp30a -operation gx,r,f,f,f -nastring .  -polish -xref example/gene_xref.txt ; done

for FILE in *; do perl /ngc/projects/gm_ext/armsim/datamove_29072021/workdir/PR080/vcftomaf/annovar/table_annovar.pl $FILE /ngc/projects/gm_ext/armsim/datamove_29072021/workdir/PR080/vcftomaf/annovar/humandb/ -buildver hg38 -out myanno -remove -protocol refGene,cytoBand,exac03,avsnp147,dbnsfp30a -operation gx,r,f,f,f -nastring .  -polish -xref /ngc/projects/gm_ext/armsim/datamove_29072021/workdir/PR080/vcftomaf/annovar/example/gene_xref.txt; mv myanno.hg38_multianno.txt /ngc/projects/gm_ext/armsim/datamove_29072021/workdir/PR080/vcftomaf/trial4/3.annotated/$FILE.txt; done
