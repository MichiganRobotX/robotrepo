# Install script for directory: /home/wamv/Documents/robotrepo/RobotX_WS/src/waypoint_follower_ros

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/wamv/Documents/robotrepo/RobotX_WS/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/waypoint_follower_ros/msg" TYPE FILE FILES
    "/home/wamv/Documents/robotrepo/RobotX_WS/src/waypoint_follower_ros/msg/PID.msg"
    "/home/wamv/Documents/robotrepo/RobotX_WS/src/waypoint_follower_ros/msg/PIDS.msg"
    "/home/wamv/Documents/robotrepo/RobotX_WS/src/waypoint_follower_ros/msg/TuningParameters.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/waypoint_follower_ros/cmake" TYPE FILE FILES "/home/wamv/Documents/robotrepo/RobotX_WS/build/waypoint_follower_ros/catkin_generated/installspace/waypoint_follower_ros-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/wamv/Documents/robotrepo/RobotX_WS/devel/include/waypoint_follower_ros")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/wamv/Documents/robotrepo/RobotX_WS/devel/share/roseus/ros/waypoint_follower_ros")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/wamv/Documents/robotrepo/RobotX_WS/devel/share/common-lisp/ros/waypoint_follower_ros")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/wamv/Documents/robotrepo/RobotX_WS/devel/share/gennodejs/ros/waypoint_follower_ros")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/wamv/Documents/robotrepo/RobotX_WS/devel/lib/python2.7/dist-packages/waypoint_follower_ros")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/wamv/Documents/robotrepo/RobotX_WS/devel/lib/python2.7/dist-packages/waypoint_follower_ros")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/wamv/Documents/robotrepo/RobotX_WS/build/waypoint_follower_ros/catkin_generated/installspace/waypoint_follower_ros.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/waypoint_follower_ros/cmake" TYPE FILE FILES "/home/wamv/Documents/robotrepo/RobotX_WS/build/waypoint_follower_ros/catkin_generated/installspace/waypoint_follower_ros-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/waypoint_follower_ros/cmake" TYPE FILE FILES
    "/home/wamv/Documents/robotrepo/RobotX_WS/build/waypoint_follower_ros/catkin_generated/installspace/waypoint_follower_rosConfig.cmake"
    "/home/wamv/Documents/robotrepo/RobotX_WS/build/waypoint_follower_ros/catkin_generated/installspace/waypoint_follower_rosConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/waypoint_follower_ros" TYPE FILE FILES "/home/wamv/Documents/robotrepo/RobotX_WS/src/waypoint_follower_ros/package.xml")
endif()

