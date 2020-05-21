#!/bin/bash
directory="./"
for file_name in `ls $directory`
do
	if [ -d $directory/$file_name ];then
		echo $file_name is dir
		cd $directory/$file_name
		for file in `ls`
		do	
			echo $file
			if [ ${file:0-4} == ".mkv" ]; then
				ln $file /mnt/disk2/Media/Movies/$file
				echo $file ok
				break
			fi
		done
		cd ..
	fi
done
