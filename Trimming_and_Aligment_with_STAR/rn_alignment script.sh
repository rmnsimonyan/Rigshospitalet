for i in $(find ../1m/data/trim2 -name "*R1_val_1_val_1.fq" | sort)
do
	echo $i
done

find ../1m/data/trim2 -name "*R1_val_1_val_1.fq" | sort
