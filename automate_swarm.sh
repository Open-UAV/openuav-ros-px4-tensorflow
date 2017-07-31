#!/bin/bash
#Script to automate all of swarm formation running

nvidia-docker run -dit --name=anna_test -p 276:276 -p 286:286 -p 6002:6002 openswarm bash

nvidia-docker exec -t anna_test bash runpy1.sh 3 & #>/dev/null &


export ROS_IP=158.130.51.35
ROS_MASTER_URI= docker inspect anna_test | grep IPAddress | awk 'FNR==2 {print $2}'| sed 's/",/:11311/g'|sed 's,",'http://',g'

python /usr/local/MATLAB/R2017a/toolbox/anna-ares/generate_formation_points.py 3 &

#nvidia-docker exec -t anna_test bash runpy2.sh 3 &>/dev/null





