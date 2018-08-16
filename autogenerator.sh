#! /bin/bash
#Archiving of previous seven days files
for i in {1..7}
do  
filename="$(date -v-"$i"d +%m-%d)"
echo $filename
if [  -f $filename ]
then
		echo "File exists.".$filename
		year="$(date +%Y)"
		month="$(date +%m)"
		echo "year:$year, month:$month"
		mkdir -p $year/$month
		`mv $filename $year/$month`
	else
		echo "File does not exist".$filename
	fi
done
monthwithdate="$(date +%m-%d)"
cp template $monthwithdate


#awk fetches in block awk '/Todo/,/---/ {print $0}' template|grep -ve "\(Todo:\|---\)"
