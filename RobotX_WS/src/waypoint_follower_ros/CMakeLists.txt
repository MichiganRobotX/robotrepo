cmake_minimum_required(VERSION 2.8.3)
add_compile_options(-std=c++11)
project(waypoint_follower_ros)

find_package(catkin REQUIRED COMPONENTS
message_generation
  roscpp
  sensor_msgs
  actionlib_msgs
  geometry_msgs
  sensor_msgs
  std_msgs
)

# add message files
add_message_files(FILES
  PID.msg
  PIDS.msg
  TuningParameters.msg
)


# Actually generate the language-specific message and service files
generate_messages(DEPENDENCIES std_msgs sensor_msgs)

# Declare that this catkin package's runtime dependencies
catkin_package(CATKIN_DEPENDS
  message_runtime std_msgs sensor_msgs
)

# specify location of header files
include_directories(include ${catkin_INCLUDE_DIRS})

# define executable usin.
add_executable(tune_PID src/controller.cpp)
add_dependencies(tune_PID ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

add_executable(waypoint_follower src/waypoint_follower.cpp)
add_dependencies(waypoint_follower ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

# define executable not using any messages/services provided by this package
#add_executable(temp_for_dependencies src/temp_for_dependencies.cpp)
add_dependencies(waypoint_follower this_does_not_exist)

# build node
target_link_libraries(tune_PID ${catkin_LIBRARIES})
target_link_libraries(waypoint_follower ${catkin_LIBRARIES})
