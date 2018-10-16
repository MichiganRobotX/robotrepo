cmake_minimum_required(VERSION 2.8.3)
add_compile_options(-std=c++11)
project(waypoint_follower)

find_package(catkin REQUIRED COMPONENTS
   roscpp
   sensor_msgs
   message_generation
   actionlib_msgs
   geometry_msgs
   sensor_msgs
   std_msgs
)

# add message files
add_message_files(
	FILES
  PID_msg.msg
  TuningParameters.msg
)

# add dependencies require to generate messages
generate_messages(DEPENDENCIES std_msgs)

# add catkin packages
catkin_package(CATKIN_DEPENDS message_runtime)

# specify location of header files
include_directories(include ${catkin_INCLUDE_DIRS})

# add node to publish signal for heartbeat
add_executable(waypoint_follower src/waypoint_follower.cpp src/controller.cpp)

add_dependencies(waypoint_follower ${catkin_EXPORTED_TARGETS})

# build node to publish signal
target_link_libraries(waypoint_follower ${catkin_LIBRARIES})
