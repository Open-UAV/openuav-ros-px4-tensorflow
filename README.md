# openuav-ros-px4-tensorflow
This repo keeps the setup for a complete docker container using ansible and docker
This dockerfile makes a image with the following installs <br />
-openuav repo <br />
-ros Kinetic <br />
-px4/mavros/mavlink <br />
-openai gym <br />
-tensorflow <br />

To build run:
sudo nvidia-docker build --no-cache=true -t openuav-gz-tf -f Dockerfile.devel-gpu .

Once running you must do the following steps:
1. Build again. Note px4 will hang (a bug) so give it a couple seconds then end it <br />
  cd ~/catkin_ws/ && catkin build
2. Rerun bashrc. When logging in bashrc is not automatically run so make sure to run it each time you log in<br />
  source ~/.bashrc 
  
To run with ansible:<br />
  add "localhost ansible_connection=local" to /etc/ansible/hosts file<br />
  ansible-playbook test-ansible.yml //the ports are automatically changed to 75 85 so when you run gzserver use -p 85
