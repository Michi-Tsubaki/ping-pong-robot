# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "riberry_startup: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iriberry_startup:/home/mech-user/ping-pong-robot/src/riberry/ros/riberry_startup/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(riberry_startup_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/riberry/ros/riberry_startup/msg/ImuFace.msg" NAME_WE)
add_custom_target(_riberry_startup_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "riberry_startup" "/home/mech-user/ping-pong-robot/src/riberry/ros/riberry_startup/msg/ImuFace.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(riberry_startup
  "/home/mech-user/ping-pong-robot/src/riberry/ros/riberry_startup/msg/ImuFace.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/riberry_startup
)

### Generating Services

### Generating Module File
_generate_module_cpp(riberry_startup
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/riberry_startup
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(riberry_startup_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(riberry_startup_generate_messages riberry_startup_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/riberry/ros/riberry_startup/msg/ImuFace.msg" NAME_WE)
add_dependencies(riberry_startup_generate_messages_cpp _riberry_startup_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(riberry_startup_gencpp)
add_dependencies(riberry_startup_gencpp riberry_startup_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS riberry_startup_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(riberry_startup
  "/home/mech-user/ping-pong-robot/src/riberry/ros/riberry_startup/msg/ImuFace.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/riberry_startup
)

### Generating Services

### Generating Module File
_generate_module_eus(riberry_startup
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/riberry_startup
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(riberry_startup_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(riberry_startup_generate_messages riberry_startup_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/riberry/ros/riberry_startup/msg/ImuFace.msg" NAME_WE)
add_dependencies(riberry_startup_generate_messages_eus _riberry_startup_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(riberry_startup_geneus)
add_dependencies(riberry_startup_geneus riberry_startup_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS riberry_startup_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(riberry_startup
  "/home/mech-user/ping-pong-robot/src/riberry/ros/riberry_startup/msg/ImuFace.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/riberry_startup
)

### Generating Services

### Generating Module File
_generate_module_lisp(riberry_startup
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/riberry_startup
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(riberry_startup_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(riberry_startup_generate_messages riberry_startup_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/riberry/ros/riberry_startup/msg/ImuFace.msg" NAME_WE)
add_dependencies(riberry_startup_generate_messages_lisp _riberry_startup_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(riberry_startup_genlisp)
add_dependencies(riberry_startup_genlisp riberry_startup_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS riberry_startup_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(riberry_startup
  "/home/mech-user/ping-pong-robot/src/riberry/ros/riberry_startup/msg/ImuFace.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/riberry_startup
)

### Generating Services

### Generating Module File
_generate_module_nodejs(riberry_startup
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/riberry_startup
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(riberry_startup_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(riberry_startup_generate_messages riberry_startup_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/riberry/ros/riberry_startup/msg/ImuFace.msg" NAME_WE)
add_dependencies(riberry_startup_generate_messages_nodejs _riberry_startup_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(riberry_startup_gennodejs)
add_dependencies(riberry_startup_gennodejs riberry_startup_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS riberry_startup_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(riberry_startup
  "/home/mech-user/ping-pong-robot/src/riberry/ros/riberry_startup/msg/ImuFace.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/riberry_startup
)

### Generating Services

### Generating Module File
_generate_module_py(riberry_startup
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/riberry_startup
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(riberry_startup_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(riberry_startup_generate_messages riberry_startup_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/riberry/ros/riberry_startup/msg/ImuFace.msg" NAME_WE)
add_dependencies(riberry_startup_generate_messages_py _riberry_startup_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(riberry_startup_genpy)
add_dependencies(riberry_startup_genpy riberry_startup_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS riberry_startup_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/riberry_startup)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/riberry_startup
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(riberry_startup_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/riberry_startup)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/riberry_startup
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(riberry_startup_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/riberry_startup)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/riberry_startup
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(riberry_startup_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/riberry_startup)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/riberry_startup
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(riberry_startup_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/riberry_startup)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/riberry_startup\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/riberry_startup
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(riberry_startup_generate_messages_py std_msgs_generate_messages_py)
endif()
