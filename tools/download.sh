#!/bin/bash
rm -r html
mkdir html
cd html
chap=$2
chap=$((chap+1))
i=1
echo "Download Novel '$1'"
while [ $i -lt $chap ]
do
    echo "Download Volume-$i..."
    wget -q $1/volume-$i.html
    i=$((i+1))
done
cd ../
sh tools/imagefix.sh $chap
sh tools/convert.sh $chap
sh tools/combine.sh $chap
echo "DONE!"