r1=()
r2=()
dir=$(pwd)

for i in $(find /ngc/people/armsim/gm/people/armsim/Downsample/10k/data/trim2 -name "*R1_val_1_val_1.fq" | sort)
do
        r1+=($i)
done

for i in $(find /ngc/people/armsim/gm/people/armsim/Downsample/10k/data/trim2 -name "*R2_val_2_val_2.fq" | sort)
do
        r2+=($i)
done


for i in $(seq 0 $((${#r1[@]}-1)))
do
        cd $dir
        folder=$(echo ${r1[$i]} | cut -f12 -d "/")
        mkdir $folder
        cp STARmapHuman.sh $folder
        cd $folder
        #echo $folder/STARmapHuman.sh ${r1[i]} ${r2[i]}
        sh $( echo STARmapHuman.sh ${r1[i]} ${r2[i]})

done
