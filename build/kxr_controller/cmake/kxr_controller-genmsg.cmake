# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "kxr_controller: 33 messages, 0 services")

set(MSG_I_FLAGS "-Ikxr_controller:/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg;-Ikxr_controller:/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(kxr_controller_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffAction.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffAction.msg" "std_msgs/Header:actionlib_msgs/GoalStatus:kxr_controller/ServoOnOffGoal:kxr_controller/ServoOnOffResult:kxr_controller/ServoOnOffActionResult:actionlib_msgs/GoalID:kxr_controller/ServoOnOffActionGoal:kxr_controller/ServoOnOffActionFeedback:kxr_controller/ServoOnOffFeedback"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg" "kxr_controller/ServoOnOffGoal:std_msgs/Header:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg" "kxr_controller/ServoOnOffResult:std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg" "kxr_controller/ServoOnOffFeedback:std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorAction.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorAction.msg" "kxr_controller/AdjustAngleVectorActionResult:std_msgs/Header:actionlib_msgs/GoalStatus:kxr_controller/AdjustAngleVectorGoal:actionlib_msgs/GoalID:kxr_controller/AdjustAngleVectorActionFeedback:kxr_controller/AdjustAngleVectorFeedback:kxr_controller/AdjustAngleVectorResult:kxr_controller/AdjustAngleVectorActionGoal"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg" "std_msgs/Header:actionlib_msgs/GoalID:kxr_controller/AdjustAngleVectorGoal"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg" "std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:kxr_controller/AdjustAngleVectorResult"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg" "std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:kxr_controller/AdjustAngleVectorFeedback"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchAction.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchAction.msg" "kxr_controller/StretchResult:std_msgs/Header:actionlib_msgs/GoalStatus:kxr_controller/StretchActionFeedback:kxr_controller/StretchActionResult:kxr_controller/StretchActionGoal:actionlib_msgs/GoalID:kxr_controller/StretchFeedback:kxr_controller/StretchGoal"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg" "std_msgs/Header:actionlib_msgs/GoalID:kxr_controller/StretchGoal"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg" "kxr_controller/StretchResult:std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg" "kxr_controller/StretchFeedback:std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlAction.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlAction.msg" "std_msgs/Header:actionlib_msgs/GoalStatus:kxr_controller/PressureControlActionResult:kxr_controller/PressureControlActionGoal:kxr_controller/PressureControlFeedback:kxr_controller/PressureControlGoal:actionlib_msgs/GoalID:kxr_controller/PressureControlResult:kxr_controller/PressureControlActionFeedback"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg" "kxr_controller/PressureControlGoal:std_msgs/Header:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg" "std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:kxr_controller/PressureControlResult"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg" "std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:kxr_controller/PressureControlFeedback"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/Stretch.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/Stretch.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoOnOff.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoOnOff.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/PressureControl.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/PressureControl.msg" ""
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoStateArray.msg" NAME_WE)
add_custom_target(_kxr_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kxr_controller" "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoStateArray.msg" "kxr_controller/ServoState:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorAction.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchAction.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/Stretch.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoOnOff.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/PressureControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)
_generate_msg_cpp(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoStateArray.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
)

### Generating Services

### Generating Module File
_generate_module_cpp(kxr_controller
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(kxr_controller_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(kxr_controller_generate_messages kxr_controller_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/Stretch.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoOnOff.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/PressureControl.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoStateArray.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_cpp _kxr_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kxr_controller_gencpp)
add_dependencies(kxr_controller_gencpp kxr_controller_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kxr_controller_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorAction.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchAction.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/Stretch.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoOnOff.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/PressureControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)
_generate_msg_eus(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoStateArray.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
)

### Generating Services

### Generating Module File
_generate_module_eus(kxr_controller
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(kxr_controller_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(kxr_controller_generate_messages kxr_controller_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/Stretch.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoOnOff.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/PressureControl.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoStateArray.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_eus _kxr_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kxr_controller_geneus)
add_dependencies(kxr_controller_geneus kxr_controller_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kxr_controller_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorAction.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchAction.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/Stretch.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoOnOff.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/PressureControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)
_generate_msg_lisp(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoStateArray.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
)

### Generating Services

### Generating Module File
_generate_module_lisp(kxr_controller
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(kxr_controller_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(kxr_controller_generate_messages kxr_controller_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/Stretch.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoOnOff.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/PressureControl.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoStateArray.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_lisp _kxr_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kxr_controller_genlisp)
add_dependencies(kxr_controller_genlisp kxr_controller_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kxr_controller_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorAction.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchAction.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/Stretch.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoOnOff.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/PressureControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)
_generate_msg_nodejs(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoStateArray.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
)

### Generating Services

### Generating Module File
_generate_module_nodejs(kxr_controller
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(kxr_controller_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(kxr_controller_generate_messages kxr_controller_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/Stretch.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoOnOff.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/PressureControl.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoStateArray.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_nodejs _kxr_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kxr_controller_gennodejs)
add_dependencies(kxr_controller_gennodejs kxr_controller_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kxr_controller_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorAction.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchAction.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/Stretch.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoOnOff.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/PressureControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)
_generate_msg_py(kxr_controller
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoStateArray.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
)

### Generating Services

### Generating Module File
_generate_module_py(kxr_controller
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(kxr_controller_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(kxr_controller_generate_messages kxr_controller_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlAction.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/Stretch.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoOnOff.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/PressureControl.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoStateArray.msg" NAME_WE)
add_dependencies(kxr_controller_generate_messages_py _kxr_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kxr_controller_genpy)
add_dependencies(kxr_controller_genpy kxr_controller_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kxr_controller_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kxr_controller
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(kxr_controller_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(kxr_controller_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kxr_controller
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(kxr_controller_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(kxr_controller_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kxr_controller
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(kxr_controller_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(kxr_controller_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kxr_controller
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(kxr_controller_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(kxr_controller_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  string(REGEX REPLACE "([][+.*()^])" "\\\\\\1" ESCAPED_PATH "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller")
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kxr_controller
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${ESCAPED_PATH}/.+/__init__.pyc?$"
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(kxr_controller_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(kxr_controller_generate_messages_py std_msgs_generate_messages_py)
endif()
