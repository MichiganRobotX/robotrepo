cmake_minimum_required(VERSION 2.8.3)

project(wamv_autonomy)

find_package(catkin REQUIRED 
	roscpp 
	rospy 
	sensor_msgs
	nav_msgs
	std_msgs
	geometry_msgs
	gazebo_msgs
	)

catkin_package()

include_directories(include ${catkin_INCLUDE_DIRS})

# Simulator
add_executable(sim nodes/sim.cpp)
target_link_libraries(sim ${catkin_LIBRARIES})

# Task 1 : Straight Line task
add_executable(straightLine nodes/straightLine.cpp)
target_link_libraries(straightLine ${catkin_LIBRARIES})