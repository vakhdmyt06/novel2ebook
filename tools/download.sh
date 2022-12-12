#!/bin/bash
rm -f -r html
mkdir html
cd html
i=1
link=$1
echo "# Download Novel HTML"
while [ ! -z "$link" ]
do
    echo "Download $i"
    wget -q $link -O volume-$i.html
    link=$(grep -o -a -m 1 -h -r "<a class=\"btn btn-success\" id=\"next_chap\" href=\"https://readlightnovels.net/.*html" volume-$i.html | grep -o -a -m 1 -h https.*html)
    echo $link
    i=$((i+1))
done
chap=$i
cd ../
if [ "$2" = "1" ];
then echo "# Skipping image fix"
else 
	echo "# Downloading images"
	bash tools/imagefix.sh $chap
fi
bash tools/convert.sh $chap
#bash tools/combine.sh $chap
echo "## Conversion DONE, files can be found at 'out/volX.epub'"