# openuav-ros-px4-tensorflow Dockerfile
This dockerfile makes a image with the following installs <br />
-openuav repo <br />
-ros Kinetic <br />
-px4/mavros/mavlink <br />
-openai gym <br />
-tensorflow <br />

To build run:
sudo nvidia-docker build --no-cache=true -t openuav-gz-tf -f Dockerfile.devel-gpu .

Once running you must do the following steps:
1. Build again. Note px4 will hang (a bug) so give it a couple seconds then end it
  cd ~/catkin_ws/ && catkin build
2. Rerun bashrc. When logging in bashrc is not automatically run so make sure to run it each time you log in
  source ~/.bashrc 
