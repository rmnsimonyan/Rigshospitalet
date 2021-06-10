#Infer set of SNPs from the list of files containing snp tables for separate samples

import pandas as pd
import math
import numpy as np

samples = pd.read_table("out2.log", header=None)

size = 81
divs = math.ceil(len(samples[0])/size)
dataframe_collection = {}

for j in range(0,divs):

    # Initialize the snplist
    snplist = []

    for i in range(size*j,size*(j+1)):


        if i == len(samples[0]):
            print("breaking loop")
            break
        print("round: ", j)
        print("sample: ",i)

        new = pd.read_csv("step1_individualSNPtables/"+samples[0][i]+".csv", index_col='Unnamed: 0')
        snplist = sorted(np.unique(np.concatenate((snplist, new.index.array), axis=0)))

    dataframe_collection[j] = snplist
    pd.DataFrame(snplist).to_csv("step2_part1_newtrial/"+str(j)+"snplist.csv", index = False)



finaltable = []

for j in range(0, len(dataframe_collection)):
    print("final round: ", j)
    finaltable = sorted(np.unique(np.concatenate((finaltable, dataframe_collection[j]), axis=0)))



pd.DataFrame(finaltable).to_csv("step2_part1_newtrial/finalsnplist.csv", index = False)
