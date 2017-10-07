#!/bin/bash
#Script to automate all of swarm formation running
source num_uavs.sh
echo $num_uavs
echo $gzweb_ctrl_port
echo $gzweb_gui_port
echo $tensorboard_port
echo $ros_websocket_port

nvidia-docker run -dit --name=anna_test -p $gzweb_ctrl_port:$gzweb_ctrl_port -p $gzweb_gui_port:$gzweb_gui_port -p $tensorboard_port:$tensorboard_port -p $ros_websocket_port:$ros_websocket_port openswarm bash
nvidia-docker exec anna_test bash /runpy1.sh $num_uavs &>/dev/null &


export ROS_IP=158.130.51.35
export ROS_MASTER_URI=$(docker inspect anna_test | grep IPAddress | awk 'FNR==2 {print $2}'| sed 's/",/:11311/g'|sed 's,",'http://',g')

nvidia-docker exec anna_test bash /runpy2.sh &>/dev/null &
python /usr/local/MATLAB/R2017a/toolbox/anna-ares/generate_formation_points.py $num_uavs &
nvidia-docker exec anna_test bash /runpy3.sh $num_uavs &>/dev/null &
nvidia-docker exec anna_test bash /runpy4.sh  &>/dev/null &


