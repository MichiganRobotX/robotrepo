# %Tag(FULLTEXT)%
cmake_minimum_required(VERSION 2.8.3)
project(subscribe_sensor_msg)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp rospy std_msgs genmsg
            sensor_msgs
            geometry_msgs)

## Declare ROS messages and services
#add_message_files(DIRECTORY msg FILES Num.msg)
#add_service_files(DIRECTORY srv FILES AddTwoInts.srv)

## Generate added messages and services
generate_messages(DEPENDENCIES geometry_msgs std_msgs sensor_msgs)

## Declare a catkin package
catkin_package(CATKIN_DEPENDS geometry_msgs)

# %EndTag(FULLTEXT)%

# add_executable(talker src/talker.cpp)
# target_link_libraries(talker ${catkin_LIBRARIES})
# add_dependencies(talker beginner_tutorials_generate_messages_cpp)

add_executable(subscriber src/subscriber.cpp)
target_link_libraries(subscriber ${catkin_LIBRARIES})
add_dependencies(subscriber beginner_tutorials_generate_messages_cpp)


# target_link_libraries(talker ${catkin_LIBRARIES})
