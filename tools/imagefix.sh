#!/bin/bash
i=1
j=1
x=1
chap=$1
chap=$((chap-1))
var1=$(grep -n -E "<li><img src=\"https:.*jpg|<li><img src=\"https:.*png" html/volume-$i.html | cut -f1 -d: | head -n1)
var=$(grep -n -E "<p><img src=\"https:.*jpg|<p><img src=\"https:.*png" html/volume-$i.html | cut -f1 -d: | head -n1)
mkdir html/media
while [ "$i" != "$chap" ] && [ "var" != "" ]
do
	while [ -n "$var1" ]
	do 
	  imglink=$(urlencode -d "\"$(awk NR==$var1  html/volume-$i.html | grep -ho "https%3.*\"" )")
	  imgname=img$i_$x.jpg
	  echo "Download $i"_"$x"
	  imglink=$(echo "$imglink" | tr -d '"')
	  curl -0 -s $imglink -o html/media/$imgname
	  imgquote=$(grep -n -E "<li><img src=\"https:.*jpg|<li><img src=\"https:.*png" html/volume-$i.html | grep -ho "width height.*>.*<" | cut -f1 -d: | head -n1)
	  imgreplac="<li><img src=\"media/$imgname\" $imgquote</li>"
	  imgreplace=$(printf '%s\n' "$imgreplac" | sed -e 's/[\/&]/\\&/g')
	  sed -i "${var1}s/<li><img src=\"https:.*/moddilap                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      topping/" html/volume-$i.html
	  sed -i "${var1}s/moddilap.*topping/${imgreplace}/" html/volume-$i.html
	  var1=$(grep -n "<li><img src=\"https:.*jpg\|<li><img src=\"https:.*png" html/volume-$i.html | cut -f1 -d: | head -n1)
	  x=$((x+1))
	done
	while [ -n "$var" ]
	do 
	  imglink=$(urlencode -d "\"$(awk NR==$var  html/volume-$i.html | grep -ho "https%3.*\"" )")
	  imgname=img$i_$x.jpg
	  echo "Download $i"_"$x"
	  imglink=$(echo "$imglink" | tr -d '"')
	  curl -0 -s $imglink -o html/media/$imgname
	  imgquote=$(grep -n -E "<p><img src=\"https:.*jpg|<p><img src=\"https:.*png" html/volume-$i.html | grep -ho "width height.*>.*<" | cut -f1 -d: | head -n1)
	  imgreplac="<p><img src=\"media/$imgname\" $imgquote</p>"
	  imgreplace=$(printf '%s\n' "$imgreplac" | sed -e 's/[\/&]/\\&/g')
	  sed -i "${var}s/<p><img src=\"https:.*/moddilap                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               topping/" html/volume-$i.html
	  sed -i "${var}s/moddilap.*topping/${imgreplace}/" html/volume-$i.html
	  var=$(grep -n "<p><img src=\"https:.*jpg\|<p><img src=\"https:.*png" html/volume-$i.html | cut -f1 -d: | head -n1)
	  x=$((x+1))
	done
	x=1
	i=$((i+1))
	var1=$(grep -n -E "<li><img src=\"https:.*jpg|<li><img src=\"https:.*png" html/volume-$i.html | cut -f1 -d: | head -n1)
	var=$(grep -n -E "<p><img src=\"https:.*jpg|<p><img src=\"https:.*png" html/volume-$i.html | cut -f1 -d: | head -n1)
done