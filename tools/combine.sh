#!/bin/bash
names= 
i=1
j=1
chap=$1
cd temp
while [ $i -lt $chap ]
do
	names= 
	for is in 1 2 3 4 5
	do
	    names=$names" vol-$i.nvl"
	    echo $names
	    i=$((i+1))
	done
	pandoc -f html -s $names -o ../novel-$j.epub
    	j=$((j+1))
done
cd ..
rm -r out