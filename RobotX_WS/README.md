# Michigan Robot X
This repository is for all Michigan RobotX Code Development and Builds

Basic Network Setup:
1. Make sure both the ops laptop and the WAM-V computer are on the same network.<br/>
	<strong>Puget IP</strong>: 192.168.1.103<br/>
	<strong>Laptop IP</strong>: 192.168.1.104<br/>

2. On <strong>Puget (in every terminal you open)</strong>:<br/>
``` bash
export ROS_IP=192.168.1.103
export ROS_MASTER_URI=http://192.168.1.103:11311
```

3. On <strong>Laptop (in every terminal you open)</strong>: <br/>
``` bash
export ROS_IP=192.168.1.104
export ROS_MASTER_URI=http://192.168.1.103:11311
```
<em>Steps 2 and 3 can also be put into the <strong>~/.bashrc</strong> file on both the systems.</em>

4. ssh into the Puget from the laptop with the following details:  <br/>
``` bash
ssh wamv@192.168.1.103
password: RobotXuser!
```  

## Launching Basic Setup
On <strong>Puget</strong>:  <br/>
1. Open 4 terminals on Puget  <br/><br/>
<strong> Terminal 1 </strong> - Run ```roscore```
``` bash
export ROS_IP=192.168.1.103
export ROS_MASTER_URI=http://192.168.1.103:11311
roscore
```
<strong> Terminal 2 </strong> - Run the transform publisher
``` bash
export ROS_IP=192.168.1.103
export ROS_MASTER_URI=http://192.168.1.103:11311
rosrun wamv_bringup wamv_tf_publisher
```
<strong> Terminal 3 </strong> - Run the drivers and odometry node
``` bash
export ROS_IP=192.168.1.103
export ROS_MASTER_URI=http://192.168.1.103:11311
roslaunch wamv_bringup bringup_puget.launch
```
<strong> Terminal 4 </strong> - Run gmapping package
``` bash
export ROS_IP=192.168.1.103
export ROS_MASTER_URI=http://192.168.1.103:11311
rosrun gmapping slam_gmapping scan:=/vel1/scan
```
<strong>Make sure all the above nodes are registered to the master at ```192.168.1.103:11311``` otherwise you won't be able to visualize the topics on the laptop</strong>

On <strong>Laptop</strong>:  <br/>
1. Open 2 Terminals on the Laptop  <br/><br/>
<strong> Terminal 1 </strong> - Connect to the Master and visualize data on Rviz
``` bash
export ROS_IP=192.168.1.104
export ROS_MASTER_URI=http://192.168.1.103:11311
```
Check if the laptop is connected by echo-ing the following topics:
```
rostopic list

# check if you can recieve the camera images
rostopic echo /ladybug_camera/camera0/image_raw/compressed 

# check if you can receive the velodyne scan
rostopic echo /vel1/scan

# check if you can receive the odometry
rostopic echo /gps/odom

# check if you receive the correct transform data
rostopic echo /tf
```
If all the above works, finally run the visualization package on the laptop
```
roslaunch wamv_bringup bringup_laptop.launch
```
<strong> Terminal 2 </strong> - Bring up the joystick controller:  <br/>
i) Check the joystick input
```bash
sudo jstest /dev/input/jsX
```
it will usually be js1<br/>
ii) Change the js permissions
```bash
sudo chmod a+rw /dev/input/jsX
```
iii) set the ros parameters  
```bash
rosparam set joy_node/dev "/dev/input/jsX"
```
iv) Run joy_node
```bash
rosrun joy joy_node
```