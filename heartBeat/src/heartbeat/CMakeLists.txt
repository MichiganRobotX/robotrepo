cmake_minimum_required(VERSION 2.8.3)

project(heartbeat)

find_package(catkin REQUIRED COMPONENTS 
	roscpp 
	rospy 
	message_generation 
	std_msgs 
	geometry_msgs)

# add message files
add_message_files(FILES beat.msg)
# add dependencies require to generate messages
generate_messages(DEPENDENCIES std_msgs)
# add catkin packages
catkin_package(CATKIN_DEPENDS message_runtime)

# specify location of header files
include_directories(include ${catkin_INCLUDE_DIRS})

# build nodes
add_executable(signal nodes/signal.cpp)
target_link_libraries(signal ${catkin_LIBRARIES})
