#!/bin/bash
echo "HTML(readlightnovels.net) TO eBOOK(.epub) CONVERTER"
echo "Dmytro Vakhitov"
if [ $# -eq 2 ]; then 
  echo "Starting..."
  sh tools/download.sh $1 $2
else
  echo "ERROR"
  echo "SYNTAX: $0 <https://lightnovels.net/nameofnovel> <amount of \$i>         UNUSED: <BEHAVIOR> <COUNT TYPE> [maximal of \$j]"
  echo "\nUNUSED:BEHAVIOR  |  COUNT TYPE\n--------\n1  |  /volume-1.html  : 1 counting up until <amount of \$i>\n1  |  /chapter-1.html  : 1 counting up until <amount of \$i>\n2  |  /volume-1-chapter-2.html  : 2 counting up until [maximal of \$j], then 1 +1, then repeat until 1 is <amount of \$i>\n3  |  /volume-1-chapter-2.html  : 1 counting up until [maximal of \$j], then 2 +1, then repeat until 2 is <amount of \$i> \n"
  echo "UNUSED:Syntax: https://lightnovels.net/nameofnovel 20 2 volume-\$i-chapter-\$j\nSyntax: https://lightnovels.net/nameofnovel 10 1 volume-\$i\n"
  echo "the output will be in 'out/'"
  echo "the old 'out/' will be moved to 'out.old', old 'out.old' will be erased."
fi