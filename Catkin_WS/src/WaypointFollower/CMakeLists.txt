cmake_minimum_required(VERSION 2.8.3)
add_compile_options(-std=c++11)
project(waypointfollower)

find_package(catkin REQUIRED COMPONENTS
   roscpp
   sensor_msgs
   message_generation
    actionlib_msgs
    geometry_msgs
    sensor_msgs
    std_msgs
)

catkin_package()

include_directories(include  ${catkin_INCLUDE_DIRS})

add_executable(waypointfollower src/waypointfollower.cpp src/controller.cpp)
target_link_libraries(waypointfollower ${catkin_LIBRARIES})

