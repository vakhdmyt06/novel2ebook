#!/bin/bash
arg_link=$1
arg_maxchap=$2
if [ $3 -eq "1" ]; 
then arg_skipimg=$3
else arg_skipimg=0
fi
echo "HTML(readlightnovels.net) TO eBOOK(.epub) CONVERTER"
echo "Dmytro Vakhitov"
echo "  LINK=$arg_link\n  ARG=$arg_maxchap$arg_skipimg"
if [ $# -eq "0" ]; then 
  echo "ERROR"
  echo "SYNTAX: $0 <https://lightnovels.net/nameofnovel> <amount of \$i> <SKIP IMAGE DOWNLOAD>"
  echo "\nSKIP IMAGE DOWNLOAD:  The script fixes images inside the html/ebook be replacing the link with a downloaded image. make <SKIP IMAGE DOWNLOAD> \'1\' if you wish to skip that."
  #echo "\nUNUSED:BEHAVIOR  |  COUNT TYPE\n--------\n1  |  /volume-1.html  : 1 counting up until <amount of \$i>\n1  |  /chapter-1.html  : 1 counting up until <amount of \$i>\n2  |  /volume-1-chapter-2.html  : 2 counting up until [maximal of \$j], then 1 +1, then repeat until 1 is <amount of \$i>\n3  |  /volume-1-chapter-2.html  : 1 counting up until [maximal of \$j], then 2 +1, then repeat until 2 is <amount of \$i> \n"
  #echo "UNUSED:Syntax: https://lightnovels.net/nameofnovel 20 2 volume-\$i-chapter-\$j\nSyntax: https://lightnovels.net/nameofnovel 10 1 volume-\$i\n"
  echo "\nthe output will be in 'out/'"
  echo "the old 'out/' will be moved to 'out.old', old 'out.old' will be erased."
else
  echo "Starting..."
  sh tools/download.sh $arg_link $arg_maxchap $arg_skipimg
fi