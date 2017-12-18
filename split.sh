#!/bin/bash
duration=$(printf "%.0f" $(soxi -D $1))
counter=0

while [ $counter -lt $duration ]
do
	sox $1 /home/ubuntu/project/playlist/temp/$counter.wav trim $counter 1
	sox /home/ubuntu/project/playlist/temp/$counter.wav -n stat &> /home/ubuntu/project/playlist/$counter.txt
	echo $(sed -n -e 7p -e 8p -e 12p /home/ubuntu/project/playlist/$counter.txt) > /home/ubuntu/project/playlist/$counter.txt
	#echo $counter.txt >> /home/ubuntu/project/playlist/filelist.txt
	counter=$((counter+1))
done
rm /home/ubuntu/project/playlist/temp/*.wav
