#! /bin/bash
number=$(cat /home/ubuntu/project/portion/info/label.txt)
counter=0

while [ $counter -lt 30 ]
do
	sox $1 ./portion/$((counter+number)).wav trim $counter 1
	sox ./portion/$((counter+number)).wav -n stat &> ./portion/$((counter+number)).txt
	echo $(sed -n -e 7p -e 8p -e 12p ./portion/$((counter+number)).txt) > ./portion/$((counter+number)).txt
	counter=$((counter+1))
done
echo $((number/30)) $1 >> /home/ubuntu/project/portion/info/name.txt
number=$((number+30))
echo $number > /home/ubuntu/project/portion/info/label.txt
rm ./portion/*.wav
