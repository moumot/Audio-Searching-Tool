#!/bin/bash

number=$(cat /home/ubuntu/project/portion/label.txt)

counter=0
while [  $counter -lt 3 ]; do
	sox $1 $((counter+number)).wav trim $counter 1
	counter=$((counter+1))
done
number=$((number+30))
echo $number > /home/ubuntu/project/portion/label.txt
