import pandas as pd

# Read the table with the names of the files that contain separate SNP tables that need to be merged
vcflist = pd.read_table("tableofnames.csv", header=None)

for j in range(1,31):
    
# Initialize the snptable with the first sample's snp table
#might need to change the address of files
snptable = pd.read_csv("file_address/"+vcflist[0][0]+".csv")
snptable.index = snptable['Unnamed: 0']
snptable = snptable.drop(['Unnamed: 0'], axis=1)


for i in range(1,vcflist[0]):
    print(i)
    
    #might need to change the address of files
    newtable = pd.read_csv("file_address/"+vcflist[0][i]+".csv")
    newtable.index = newtable['Unnamed: 0']
    newtable = newtable.drop(['Unnamed: 0'], axis=1)
    snptable = pd.merge(snptable, newtable, left_index=True, right_index=True, how="outer")
    
snptable = snptable.fillna(0)
snptable.to_csv("SNPfinaltable.csv", index = True)
