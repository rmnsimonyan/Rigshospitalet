import pandas as pd
import math

cells = pd.read_table("out2.log", header=None)

snps = pd.read_csv("step2_part1_newtrial/finalsnplist.csv", header=None, index=0) #make sure this is right

fintable = pd.DataFrame(index=table[1].unique())

for i in range(0,len(cells)):
    print(i)
    # Initialize the snptable with the first sample's snp table
    newcell = pd.read_csv("step1_/"+cells[0][i]+".csv", index_col='Unnamed: 0')
    newcell.sort_index(inplace=True)
    exptable = pd.merge(pd.DataFrame(index=table[1].unique()), newcell, left_index=True, right_index=True, how="outer")

    fintable = pd.concat([fintable,exptable], axis=1)


fintable.to_csv("FFFIINaltableSNPexp.csv", index = True)
