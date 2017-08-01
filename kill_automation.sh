#!/bin/bash
#Script that kills all of automate_swarm.sh
#WARNING: kills all running python and MATLAB processes by jdas

kill $(ps -u jdas | grep MATLAB | awk '{print $1}')
kill $(ps -u jdas | grep python | awk '{print $1}')
docker stop anna_test
docker rm anna_test



