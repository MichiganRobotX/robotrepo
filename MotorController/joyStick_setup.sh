#!/bin/bash

# Set the joystick permission
sudo chmod a+rw /dev/input/js2

# Mao the joystick in ros
rosparam set joy_node/dev "/dev/input/js2"

# Start the Joystick Node
rosrun joy joy_node

# Open a new terminal and show the joystick 
terminal -e rostopic echo joy
