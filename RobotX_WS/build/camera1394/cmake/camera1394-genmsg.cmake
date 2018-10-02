# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "camera1394: 0 messages, 2 services")

set(MSG_I_FLAGS "")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(camera1394_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/SetCameraRegisters.srv" NAME_WE)
add_custom_target(_camera1394_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "camera1394" "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/SetCameraRegisters.srv" ""
)

get_filename_component(_filename "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/GetCameraRegisters.srv" NAME_WE)
add_custom_target(_camera1394_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "camera1394" "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/GetCameraRegisters.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(camera1394
  "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/SetCameraRegisters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera1394
)
_generate_srv_cpp(camera1394
  "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/GetCameraRegisters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera1394
)

### Generating Module File
_generate_module_cpp(camera1394
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera1394
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(camera1394_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(camera1394_generate_messages camera1394_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/SetCameraRegisters.srv" NAME_WE)
add_dependencies(camera1394_generate_messages_cpp _camera1394_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/GetCameraRegisters.srv" NAME_WE)
add_dependencies(camera1394_generate_messages_cpp _camera1394_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(camera1394_gencpp)
add_dependencies(camera1394_gencpp camera1394_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS camera1394_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(camera1394
  "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/SetCameraRegisters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/camera1394
)
_generate_srv_eus(camera1394
  "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/GetCameraRegisters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/camera1394
)

### Generating Module File
_generate_module_eus(camera1394
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/camera1394
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(camera1394_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(camera1394_generate_messages camera1394_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/SetCameraRegisters.srv" NAME_WE)
add_dependencies(camera1394_generate_messages_eus _camera1394_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/GetCameraRegisters.srv" NAME_WE)
add_dependencies(camera1394_generate_messages_eus _camera1394_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(camera1394_geneus)
add_dependencies(camera1394_geneus camera1394_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS camera1394_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(camera1394
  "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/SetCameraRegisters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera1394
)
_generate_srv_lisp(camera1394
  "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/GetCameraRegisters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera1394
)

### Generating Module File
_generate_module_lisp(camera1394
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera1394
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(camera1394_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(camera1394_generate_messages camera1394_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/SetCameraRegisters.srv" NAME_WE)
add_dependencies(camera1394_generate_messages_lisp _camera1394_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/GetCameraRegisters.srv" NAME_WE)
add_dependencies(camera1394_generate_messages_lisp _camera1394_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(camera1394_genlisp)
add_dependencies(camera1394_genlisp camera1394_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS camera1394_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(camera1394
  "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/SetCameraRegisters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/camera1394
)
_generate_srv_nodejs(camera1394
  "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/GetCameraRegisters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/camera1394
)

### Generating Module File
_generate_module_nodejs(camera1394
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/camera1394
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(camera1394_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(camera1394_generate_messages camera1394_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/SetCameraRegisters.srv" NAME_WE)
add_dependencies(camera1394_generate_messages_nodejs _camera1394_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/GetCameraRegisters.srv" NAME_WE)
add_dependencies(camera1394_generate_messages_nodejs _camera1394_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(camera1394_gennodejs)
add_dependencies(camera1394_gennodejs camera1394_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS camera1394_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(camera1394
  "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/SetCameraRegisters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera1394
)
_generate_srv_py(camera1394
  "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/GetCameraRegisters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera1394
)

### Generating Module File
_generate_module_py(camera1394
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera1394
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(camera1394_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(camera1394_generate_messages camera1394_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/SetCameraRegisters.srv" NAME_WE)
add_dependencies(camera1394_generate_messages_py _camera1394_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dasc/Downloads/RobotX/robotrepo/RobotX_WS/src/camera1394/srv/GetCameraRegisters.srv" NAME_WE)
add_dependencies(camera1394_generate_messages_py _camera1394_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(camera1394_genpy)
add_dependencies(camera1394_genpy camera1394_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS camera1394_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera1394)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera1394
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/camera1394)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/camera1394
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera1394)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera1394
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/camera1394)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/camera1394
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera1394)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera1394\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera1394
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
