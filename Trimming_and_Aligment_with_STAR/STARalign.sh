#!/bin/bash

module load ngctools
module load tools
#module load star/2.5.2b
module load gcc/8.2.0 star/2.7.2b

fwd=$1
rev=$2
OUTDIR=$2

echo $fwd
#echo $rev

rm -rf "$OUTDIR/*_STARtmp"

echo "commandline:"
#cmd="STAR --runThreadN 10 --genomeDir /ngc/projects/gm/people/vicpro/cambridge/scripts/ref/STAR_ERCC --sjdbGTFfile /ngc/projects/gm/people/vicpro/cambridge/scripts/ref/Homo_sapiens_GRCh38_dna_sm_primary_assembly_ERCC_fa.gtf --readFilesIn $fwd --genomeLoad NoSharedMemory --quantMode TranscriptomeSAM GeneCounts --readFilesCommand zcat --outSAMtype BAM SortedByCoordinate --limitBAMsortRAM 35000000000"

cmd="STAR --runThreadN 10 --genomeDir /ngc/shared/resources/h.sapiens/hg19/genomes/1000genomes/20110707/star/2.7.2b --sjdbGTFfile /ngc/projects/gm/data/resources/ngs/hg19/annotation/GRCh37_latest_genomic.gtf --readFilesIn $fwd --genomeLoad NoSharedMemory --quantMode TranscriptomeSAM GeneCounts --readFilesCommand zcat --outSAMtype BAM SortedByCoordinate --limitBAMsortRAM 35000000000"

echo "$cmd"
eval "$cmd"
