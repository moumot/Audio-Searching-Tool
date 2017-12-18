#! /bin/bash

count=$(uniq -c /home/ubuntu/project/playlist/temp/result.txt| sed 1q | cut -d " " -f 6)
track=$(uniq -c /home/ubuntu/project/playlist/temp/result.txt| sed 1q | cut -d " " -f 7)
name=""
if [ $count -ge 3 ]
then
	line=$(cut -d " " -f 1 /home/ubuntu/project/portion/info/name.txt | grep -n $track | sed 's/^\([0-9]\+\):.*$/\1/')
	line="${line}p"
	name=$(sed -n $line /home/ubuntu/project/portion/info/name.txt |cut -d " " -f 2)
	cp $name /home/ubuntu/project/playlist/$(basename "$name" ".wav").wav
	echo song found: $name
else
	echo song not found
fi
#echo $count
#echo $track
sudo chmod 777 /home/ubuntu/project/playlist/temp/result.txt
rm  /home/ubuntu/project/playlist/temp/result.txt
rm /home/ubuntu/project/playlist/*.txt
