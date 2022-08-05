#!/bin/bash

subnet=$1
type=$2
filter=$3
find=0

if [ "$filter" != "" ] 
then
	cmd='gcloud projects list --format="value(projectId)" --filter="$filter"'
else
	cmd='gcloud projects list --format="value(projectId)"'
fi

echo "Date: $(date '+%Y-%m-%d %H:%M:%S')"  > result.log
echo "Search: $subnet" >> result.log
echo "----------------------------------" >> result.log
echo "" > projects.log
echo "" > ranges.log


for project in  $(eval $cmd) 
do
	echo -e "\033[1;34mChecking project: $project\033[0m"
	echo "$project" >> projects.log
	gcloud config set project $project
	#gcloud config set disable_prompts true
	has=""
	for api in $(gcloud services list --enabled --filter compute.googleapis.com --format="value(NAME)")
	do
		has=$api
	done
	
	###echo $has
	
	if [ "$has" = "compute.googleapis.com" ] 
	then	
		
		for range in $(gcloud compute networks subnets list --quiet --format="value(RANGE)") 
		do
			
			echo "$range" >> ranges.log
			if [ "$range" = "$subnet" ]
			then
				echo "Project ID:  $project" >> result.log
				echo "Range: $range" >> result.log
				find=1
				if [ "$type" = "first" ] 
				then 
					break; 
				fi;
			fi		
		done
		if [ $find -eq 1 ] 
		then
			if [ "$type" = "first" ] 
			then 
				break; 
			fi;
		fi
	fi
	echo -e "\033[0;34mChecked\033[0m"
done

if  grep -q "Project ID:" result.log; then 
	echo -e "\033[0m######################################"
	echo -e "\033[1;31mSubnet $subnet does exist!"
	echo -e "\033[0m######################################\033[0;31m"
	grep  "Project ID:" result.log
	grep  "Range:" result.log 
	echo -e "\033[0m######################################";
else
	echo -e "\033[0m######################################"
        echo -e "\033[1;32mSubnet $subnet does not exist!"
        echo -e "\033[0m######################################";
fi
