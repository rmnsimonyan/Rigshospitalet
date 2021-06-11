r1=()
r2=()

for i in $(find /ngc/people/armsim/gm/people/armsim/Downsample/1m/data/trim2 -name "*R1_val_1_val_1.fq" | sort)
do
        r1+=($i)
done

for i in $(find /ngc/people/armsim/gm/people/armsim/Downsample/1m/data/trim2 -name "*R2_val_2_val_2.fq" | sort)
do
        r2+=($i)
done


 for i in $(seq 1 {#r1[@]})
 do
 	echo $i-1
 done

echo

for i in $(find /ngc/people/armsim/gm/people/armsim/Downsample/1m/data/trim2 -name "*R2_val_2_val_2.fq" | sort)
do
        r2+=($i)
done




echo ${a[@]}
