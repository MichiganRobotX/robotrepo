# robotrepo

This repository is for all Michigan RobotX Code Development and Builds

Launch Instructions for all code:

1) Make sure both the ops laptop and the WAM-V computer are on the same network.
  OPS IP: 192.168.1.104
  WAMV IP: 192.168.1.103

2) The ROS_IP and ROS_MASTER_URI lines in the .bashrc file should be uncommented on both computers.

3) ssh into the WAMV from the ops laptop:
  ssh wamv@192.168.1.103
  password: RobotXuser!

4) Launch the .launch file in the wamv_bringup package.

5) On the ops laptop, bring up the joystick controller:

  i) Check the joystick input
    sudo jstest /dev/input/jsX
    it will usually be js1

  ii) Change the js permissions
    sudo chmod a+rw /dev/input/jsX

  iii) set the ros parameters  
    rosparam set joy_node/dev "/dev/input/jsX"

  iv) Run joy_node
    rosrun joy joy_node

6) Visualize data using rviz 
