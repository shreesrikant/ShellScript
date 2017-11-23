#!/bin/bash

DIR_PATH="/apps/applogs/archived_logs_"`date +%Y-%m`"/novopay/"
echo $DIR_PATH
TODAY=`date +%d`
FileName=`date -d "yesterday" +%Y-%m-%d_`
cd $DIR_PATH
File_List=`ls "$FileName"*`

echo $File_List

for f in $File_List; do 
	newname=`echo $f | cut -d'.' -f1`
	newname=`echo $newname"-"$(date -r "$f" +%H-%M).tar.gz`
	mv $f $newname
done
