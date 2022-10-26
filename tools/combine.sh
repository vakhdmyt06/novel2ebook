#!/bin/bash
names= 
i=1
chap=$1
while [ $i -lt $chap ]
do
    names=$names" out/vol$i.epub"
    echo $names
    i=$((i+1))
done
pandoc -s $names -o novel-output.epub
rm -r out