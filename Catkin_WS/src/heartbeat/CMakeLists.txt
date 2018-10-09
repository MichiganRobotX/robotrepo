cmake_minimum_required(VERSION 2.8.3)

project(heartbeat)

find_package(catkin REQUIRED COMPONENTS 
	roscpp 
	rospy 
	message_generation 
	std_msgs 
	geometry_msgs
	sensor_msgs
	gazebo_msgs)

# add message files
add_message_files(
	FILES 
	heartBeat.msg
	entranceExit.msg
	scanCode.msg
	dockTask.msg
	detectDeliver.msg
	finalMsg.msg
	)

# add dependencies require to generate messages
generate_messages(DEPENDENCIES std_msgs)
# add catkin packages
catkin_package(CATKIN_DEPENDS message_runtime)

# specify location of header files
include_directories(include ${catkin_INCLUDE_DIRS})

# add node to publish signal for heartbeat
add_executable(signal nodes/signal.cpp)

# build node to publish signal for heartbeat
target_link_libraries(signal ${catkin_LIBRARIES})
