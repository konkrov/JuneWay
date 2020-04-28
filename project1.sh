#!/bin/bash

CheckURLs() {
if [ -z $1 ]
then
echo "No dir to URL file."
exit
fi

if [ ! -f $1urls.txt ] 
then echo "No URL file."; 
exit
fi

while read url; do 
 if [[ -n $url ]]
 then
  code=`curl -Is $url | head -n 1 | cut '-d ' '-f2' 2> /dev/null` # | cut -c 1`
  if [[ -z $code ]]||[[ $code == 4* ]]||[[ $code == 5* ]]  
  then echo "Alarm!" $url $code
  #exit
  #else echo 'OK'  $url $code
  fi 
 fi
 done < $1urls.txt
}

CheckURLs $1
