execute_process(COMMAND "/home/robotx/github/robotrepo/Catkin_WS/build/image_common/camera_calibration_parsers/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/robotx/github/robotrepo/Catkin_WS/build/image_common/camera_calibration_parsers/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
