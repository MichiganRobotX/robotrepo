cmake_minimum_required(VERSION 2.8.3)

project(teleop_controller)

find_package(catkin REQUIRED COMPONENTS 
	roscpp 
	rospy 
	message_generation 
	std_msgs 
	geometry_msgs
	sensor_msgs
	gazebo_msgs)

# add message files


# add dependencies require to generate messages
generate_messages(DEPENDENCIES std_msgs)
# add catkin packages
catkin_package(CATKIN_DEPENDS message_runtime)

# specify location of header files
include_directories(include ${catkin_INCLUDE_DIRS})

# add node to publish teleop controller


# build node to publish

