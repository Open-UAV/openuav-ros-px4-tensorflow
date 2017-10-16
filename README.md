# openuav-ros-px4-tensorflow
This repo keeps the setup for a complete docker container using ansible and docker
This dockerfile makes a image with the following installs <br />
-openuav repo <br />
-ros Kinetic <br />
-px4/mavros/mavlink <br />
-openai gym <br />
-tensorflow <br />

## To build:
run: sudo nvidia-docker build --no-cache=true -t openuav-gz-tf -f Dockerfile.devel-gpu <br />
Note: this will take a while to setup (~45min)

Once running you must do the following steps:
1. Build again. Note px4 will hang (a bug) so give it a couple seconds then end it <br />
  cd ~/catkin_ws/ && catkin build
2. Rerun bashrc. When logging in bashrc is not automatically run so make sure to run it each time you log in<br />
  source ~/.bashrc
  
## To run with ansible:<br />
  add "localhost ansible_connection=local" to /etc/ansible/hosts file<br />
  Run the playbook. The ports are automatically changed to 75 85 so when you run gzserver use -p 85<br />
  ansible-playbook test-ansible.yml --extra-vars "outport =85 inport=75"

## To add GUI application/Camera simulation support:
  1. Log into the host machine physically (no ssh). Xhost will not allow changes remotely for security reasons <br />
  2. Run xhost +local: . Be aware of the security issues. This allows any user on the machine to have access to the xsession <br />
  3. Run the container with: <br />
  docker run -dit \ <br />
    -v /tmp/.X11-unix:/tmp/.X11-unix \<br />
    -e DISPLAY=$DISPLAY \<br />
    openuav-gz-tf bash<br />
    
  4. This should make a container that forwards xapps to the machine (ssh -X will not push that to your remote machine. See below). This will also allow camera emulation inside of a ros simulation. For remote access to the camera, setup ssh server on conatiner and connect through a forwarded docker port.
## Using local Xserver for camera support 
On container, run the following
  Xvfb :1 -screen 0 1600x1200x16  &
  export DISPLAY=:1.0
