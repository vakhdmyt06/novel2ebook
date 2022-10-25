#!/bin/bash
echo "HTML(readlightnovels.net) TO eBOOK(.epub) CONVERTER"
echo "Dmytro Vakhitov"
if [ $# -eq 2 ]; then 
  echo "Starting..."
  sh tools/download.sh $1 $2
else
  echo "ERROR"
  echo "SYNTAX: $0 <https://lightnovels.net/nameofnovel> <amount of volumes>"
  echo "the output will be in 'out/'"
  echo "the old 'out/' will be moved to 'out.old', old 'out.old' will be erased."
fi