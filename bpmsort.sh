#!/bin/bash
mkdir /home/ubuntu/project/playlist/mp3

for filename in /home/ubuntu/project/playlist/*.wav; do
	(sox $filename $(echo /home/ubuntu/project/playlist/mp3/$(basename "$filename" ".wav")).mp3)
done

for filename in /home/ubuntu/project/playlist/mp3/*.mp3; do
	(bpm-tag -f $filename) &>> /home/ubuntu/project/playlist/bpmtest.txt
done

sort -n -t ' ' -k 2 /home/ubuntu/project/playlist/bpmtest.txt > /home/ubuntu/project/playlist/bpmsorted.txt
rm -rf /home/ubuntu/project/playlist/mp3

filename='/home/ubuntu/project/playlist/bpmsorted.txt'
prefix="/home/ubuntu/project/playlist/mp3/"
while read p; do 
        p=${p#$prefix} 
        echo $p >> /home/ubuntu/project/playlist/bpmfinal.txt
done < $filename

rm /home/ubuntu/project/playlist/bpmsorted.txt
rm /home/ubuntu/project/playlist/bpmtest.txt


