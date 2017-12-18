#! /bin/bash
norm=$(cut -d " " -f 3 $1 | sed 's/-//g')
amplitude=$(cut -d " " -f 6 $1 | sed 's/-//g')
delta=$(cut -d " " -f 9 $1 | sed 's/-//g')

for file in /home/ubuntu/project/playlist/*.txt;do
	snorm=$(cut -d " " -f 3 $file | sed 's/-//g')
	samplitude=$(cut -d " " -f 6 $file | sed 's/-//g')
	sdelta=$(cut -d " " -f 9 $file | sed 's/-//g')
	bnorm=$(echo "($norm-$snorm)/$norm" | bc | sed 's/-//g')
	bamplitude=$(echo "($amplitude-$samplitude)/$amplitude" | bc | sed 's/-//g')
	bdelta=$(echo "($delta-$sdelta)/$delta" | bc | sed 's/-//g')
	temp=0

	if [ $(echo "$temp >= $bnorm" |bc -l) -eq 1 ]
	then
		if [ $(echo "$temp >= $bamplitude" |bc -l) -eq 1 ]
		then
			if [ $(echo "$temp >= $bdelta" |bc -l) -eq 1 ]
			then
				track=$(echo $(basename "$1" ".txt"))
				track=$((track/30))
				echo $track >> /home/ubuntu/project/playlist/temp/result.txt
			fi
		fi
	fi
done

echo done


