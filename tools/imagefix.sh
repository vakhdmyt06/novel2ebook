#!/bin/bash
i=1
j=1
x=1
chap=$1
var1=$(grep -n "<li><img src=\"https:.*jpg" html/volume-$i.html | cut -f1 -d: | head -n1)
var=$(grep -n "<p><img src=\"https:.*jpg" html/volume-$i.html | cut -f1 -d: | head -n1)
mkdir html/media
while [ "$i" != "$chap" ]
do
	while [ -n "$var" ]
	do 
	  imglink=$(urlencode -d "\"$(awk NR==$var  html/volume-$i.html | grep -ho "https%3.*\"" )")
	  imgname=img$i$x.jpg
	  echo "Download Cover IMG"
	  imglink=$(echo "$imglink" | tr -d '"')
	  curl -0 -s $imglink -o html/media/$imgname
	  imgquote=$(grep -ho "width height.*>.*<" html/volume-$i.html | cut -f1 -d: | head -n1)
	  imgreplace="<li><img src=\"media\/$imgname\" $imgquote\/li>"
	  sed -i "${var}s/<li><img src=\"https:.*/<li><img src=${imgreplace}/" html/volume-$i.html
	  var=$(grep -n "<li><img src=\"https:.*jpg" html/volume-$i.html | cut -f1 -d: | head -n1)
	  x=$((x+1))
	done
	while [ -n "$var1" ]
	do 
	  imglink=$(urlencode -d "\"$(awk NR==$var1  html/volume-$i.html | grep -ho "https%3.*\"" )")
	  imgname=img$i$x.jpg
	  echo "Download IMG"
	  imglink=$(echo "$imglink" | tr -d '"')
	  curl -0 -s $imglink -o html/media/$imgname
	  imgquote=$(grep -ho "width height.*>.*<" html/volume-$i.html | cut -f1 -d: | head -n1)
	  imgreplace="<p><img src=\"media\/$imgname\" $imgquote\/p>"
	  sed -i "${var1}s/<p><img src=\"https:.*/<p><img src=${imgreplace}/" html/volume-$i.html
	  var1=$(grep -n "<p><img src=\"https:.*jpg" html/volume-$i.html | cut -f1 -d: | head -n1)
	  x=$((x+1))
	done
	x=1
	i=$((i+1))
	var1=$(grep -n "<li><img src=\"https:.*jpg" html/volume-$i.html | cut -f1 -d: | head -n1)
	var=$(grep -n "<p><img src=\"https:.*jpg" html/volume-$i.html | cut -f1 -d: | head -n1)
done