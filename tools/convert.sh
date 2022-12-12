#!/bin/bash
echo "# cutting and converting 'html' to 'epub'"
mv out .out.old
rm -r out
rm -r temp
mkdir temp
mkdir out
chap=$1
i=1
while [ $i -lt $chap ]   
do
  MYASS=$i
  echo "- Volume $MYASS"
  cp html/volume-$MYASS.html temp/volume-$MYASS.temp
  sed -i 's/><\/div>/><\/div>\n<p>Do regular breaks!<\/p>/g' temp/volume-$MYASS.temp
  sed -e '1,/<div class="chapter-content">/ d;/<!-- AI CONTENT END 2 -->/Q' temp/volume-$MYASS.temp > temp/vol-$MYASS.nvl
  echo "making epub"
  cd html
  pandoc --self-contained -f  html -t epub3 --metadata title="Novel2Ebook Novel Vol. $MYASS" -o ../out/vol$MYASS.epub ../temp/vol-$MYASS.nvl
  cd ..
  #printf "remove "
  #find vol-$MYASS.nvl
  #rm temp/vol-$MYASS.nvl
  printf "created epub: "
  find out/vol$MYASS.epub
  i=$((i+1))
done
#echo "move image folder to temp dir"
#mkdir temp/media
#mv html/media/* temp/media
rm -r html temp