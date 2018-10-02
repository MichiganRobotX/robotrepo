#!/bin/bash
# small utility script to check URDF consistence and display in RVIZ
roslaunch urdf_tutorial display.launch model:='$(find kingfisher_description)/urdf/kingfisher_robotx.xacro'