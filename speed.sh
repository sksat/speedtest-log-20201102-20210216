#!/bin/bash

#/usr/bin/speedtest --server 15047 --csv >> /home/sksat/speed/`date -u "+%Y-%m-%d"`.csv
line=`/usr/bin/speedtest --server 15047 --csv`

csv=()

for ((i=1; i < 11; i++)); do
	a=`echo ${line} | cut -d ',' -f ${i}`
	#echo $a
	csv=("${csv[@]}" "$a")
done
timestamp=${csv[3]}
csv[3]=`date -d $timestamp '+%Y-%m-%d-%H:%M:%S'`

out=`echo -n ${csv[0]}`
for ((i=1; i < 10; i++)); do
	out=$out`echo -n ','${csv[i]}`
done

echo $out >> /home/sksat/speed/`date "+%Y-%m-%d"`.csv
