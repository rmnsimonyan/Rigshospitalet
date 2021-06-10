Module load ngctools
Module load seqtk/1.3 

# Downsample CELLfq.gz into CELL_5k.fq, 5000 reads
seqtk sample -s100 CELL.fq.gz 5000 > CELL_5k.fq 
