cmake_minimum_required(VERSION 2.8.3)
project(fusion)

find_package(catkin REQUIRED COMPONENTS 
	roscpp 
	gazebo_msgs 
	geometry_msgs 
	sensor_msgs 
	message_filters 
	gps_common)

catkin_package()

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(navsatToOdom nodes/navsatToOdom.cpp)

target_link_libraries(navsatToOdom ${catkin_LIBRARIES})
