# Install script for directory: /home/wamv/Documents/robotrepo/RobotX_WS/src/imu_tools/imu_complementary_filter

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/wamv/Documents/robotrepo/RobotX_WS/build/imu_tools/imu_complementary_filter/catkin_generated/installspace/imu_complementary_filter.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/imu_complementary_filter/cmake" TYPE FILE FILES
    "/home/wamv/Documents/robotrepo/RobotX_WS/build/imu_tools/imu_complementary_filter/catkin_generated/installspace/imu_complementary_filterConfig.cmake"
    "/home/wamv/Documents/robotrepo/RobotX_WS/build/imu_tools/imu_complementary_filter/catkin_generated/installspace/imu_complementary_filterConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/imu_complementary_filter" TYPE FILE FILES "/home/wamv/Documents/robotrepo/RobotX_WS/src/imu_tools/imu_complementary_filter/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/wamv/Documents/robotrepo/RobotX_WS/devel/lib/libcomplementary_filter.so")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/imu_complementary_filter" TYPE EXECUTABLE FILES "/home/wamv/Documents/robotrepo/RobotX_WS/build/imu_tools/imu_complementary_filter/CMakeFiles/CMakeRelink.dir/complementary_filter_node")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/imu_complementary_filter" TYPE DIRECTORY FILES "/home/wamv/Documents/robotrepo/RobotX_WS/src/imu_tools/imu_complementary_filter/include/imu_complementary_filter/" FILES_MATCHING REGEX "/[^/]*\\.h$" REGEX "/\\.svn$" EXCLUDE)
endif()

