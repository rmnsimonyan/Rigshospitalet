# Run from the folder where fq files are located
#!/bin/bash
set -euo pipefail

module load ngctools
module load perl/5.20.2 anaconda2/4.4.0 trim_galore/0.4.0
module load java/1.8.0 fastqc/0.11.5
module load parallel/20170822


mkdir -p data/trim1
mkdir -p data/trim2
mkdir -p fastQC/trim1
mkdir -p fastQC/trim2

# NEXTERA adapters
adapter1="CTGTCTCTTATACACATCT"

# SmarTer-kit adapters
adapter2="AAGCAGTGGTATCAACGCAGAGT"

echo "#################################" >&2
echo "############ Trimming first time" >&2
echo "#################################" >&2
TRIMPARAMS1="-o data/trim1 --paired -q 15 --stringency 3 --length 36 --phred33 --fastqc --fastqc_args \"--outdir=fastQC/trim1/\" -a ${adapter1}"
find -name "*_R1.fastq" | sed "s/_R1.fastq$//" | parallel --will-cite -j24 --delay 200 trim_galore ${TRIMPARAMS1} {1}_R1.fastq {1}_R2.fastq

echo "#################################" >&2
echo "############ Trimming second time" >&2
echo "#################################" >&2
TRIMPARAMS2="-o data/trim2 --paired -q 15 --stringency 3 --length 36 --phred33 --fastqc --fastqc_args \"--outdir=fastQC/trim2/\" -a ${adapter2}"
find data/trim1 -name "*R1_val_1.fq" | sed "s/_R1_val_1.fq$//" | parallel --will-cite -j24 --delay 200 trim_galore ${TRIMPARAMS2} {1}_R1_val_1.fq {1}_R2_val_2.fq
