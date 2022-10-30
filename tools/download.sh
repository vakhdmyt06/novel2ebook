#!/bin/bash
rm -f -r html
mkdir html
cd html
chap=$2
chap=$((chap+1))
i=1
echo "# Download Novel HTML"
while [ $i -lt $chap ]
do
    echo "Download Volume-$i"
    wget -q $1/volume-$i.html
    i=$((i+1))
done
cd ../
if [ "$3" = "1" ];
then echo "# Skipping image fix"
else 
	echo "# Downloading images"
	bash tools/imagefix.sh $chap
fi
bash tools/convert.sh $chap
#bash tools/combine.sh $chap
echo "# Conversion DONE, files can be found at 'out/volX.epub'"