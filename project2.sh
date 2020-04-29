#!/bin/bash
if [ -z $1 ]
then
echo 'Usege: project2.sh logfile' 
exit
fi

if [ ! -f $1 ] 
then echo 'No log file.'; 
exit
fi
cat $1 | awk '{print $1}' |sort | uniq -c | sort -nr | head -n 10 
