#!/bin/bash
#Deletes docker images older than WEEKS_OLD weeks
let WEEKS_OLD=4
#Weeks
docker rmi -f $(docker images | grep weeks| awk -v weeks_old=$WEEKS_OLD '$4 > weeks_old {print $3}' | grep -v c62e8b663879)

#Months
if [ "$WEEKS_OLD" -ge "8" ];
then
let MONTHS_OLD=$WEEKS_OLD/4
docker rmi -f $(docker images | grep months| awk -v months_old=$MONTHS_OLD '$4 > months_old {print $3}' | grep -v c62e8b663879)

else
docker rmi -f $(docker images | grep months| awk '{print $3}' | grep -v c62e8b663879)
fi
    

