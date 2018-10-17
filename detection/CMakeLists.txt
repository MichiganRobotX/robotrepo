cmake_minimum_required(VERSION 2.8.3)
project(detection)

find_package(catkin REQUIRED COMPONENTS
   OpenCV REQUIRED
   roscpp
   sensor_msgs
   pcl_conversions
   pcl_ros
   cv_bridge
   image_transport
   message_generation
    actionlib_msgs
    geometry_msgs
    sensor_msgs
    std_msgs
)

add_message_files(
  FILES
    BoundingBox.msg
    BoundingBoxes.msg
)

generate_messages(
  DEPENDENCIES
    actionlib_msgs
    geometry_msgs
    sensor_msgs
    std_msgs
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES my_pcl_tutorial
   CATKIN_DEPENDS message_runtime
#  DEPENDS system_lib
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

find_package( OpenCV REQUIRED )
include_directories(include ${OpenCV_INCLUDE_DIRS})


add_executable(2d3d src/2d3d.cpp)
target_link_libraries(2d3d ${catkin_LIBRARIES})
add_dependencies(2d3d ${catkin_EXPORTED_TARGETS})

