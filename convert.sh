#!/bin/bash
echo "HTML(readlightnovels.net) TO eBOOK(.epub) CONVERTER"
echo "Dmytro Vakhitov"
echo "Converting 'html/volume-*.html' to 'out/vol*.epub'"
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
do
  MYASS=$i
  echo "\n - Volume $MYASS"
  echo "copy html/volume-$MYASS.html to volume-$MYASS.temp"
  cp html/volume-$MYASS.html volume-$MYASS.temp
  echo "add page identifier"
  sed -i 's/><\/div>/><\/div>\n<p>PAGE<\/p>/g' volume-$MYASS.temp
  echo "extract text to vol-$MYASS.nvl"
  sed -e '1,/<div class="chapter-content">/ d;/<ol>/Q' volume-$MYASS.temp > vol-$MYASS.nvl
  printf "remove "
  find volume-$MYASS.temp
  rm volume-$MYASS.temp
  echo "making epub"
  pandoc --extract-media out/media --request-header User-Agent:"Firefox/106.0"--self-contained -f  html -t epub3 --metadata title="Mushoku Tensei: Jobless Reincarnation | Vol. $MYASS" -o out/vol$MYASS.epub vol-$MYASS.nvl
  printf "remove "
  find vol-$MYASS.nvl
  rm vol-$MYASS.nvl
  printf "created epub: "
  find out/vol$MYASS.epub
done