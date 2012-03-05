#!/bin/bash
j=0
for i in /home/shubham/Pictures/*
do
    j=$[$j+1]
done

l=$[ $RANDOM % $j ]
j=0

for i in /home/shubham/Pictures/*
do
    j=$[$j+1]
    if [ $j -eq $l ]
    then
	file=$i
	break
    fi
done
lo=background\=$file
line=$(sed 's!^back.*!'"$lo"'!g' /etc/lightdm/unity-greeter.conf )  
echo "$line" >/etc/lightdm/unity-greeter.conf
