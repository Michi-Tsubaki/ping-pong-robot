# Install script for directory: /home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/mech-user/ping-pong-robot/install")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mech-user/ping-pong-robot/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mech-user/ping-pong-robot/install" TYPE PROGRAM FILES "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mech-user/ping-pong-robot/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mech-user/ping-pong-robot/install" TYPE PROGRAM FILES "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mech-user/ping-pong-robot/install/setup.bash;/home/mech-user/ping-pong-robot/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mech-user/ping-pong-robot/install" TYPE FILE FILES
    "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/setup.bash"
    "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mech-user/ping-pong-robot/install/setup.sh;/home/mech-user/ping-pong-robot/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mech-user/ping-pong-robot/install" TYPE FILE FILES
    "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/setup.sh"
    "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mech-user/ping-pong-robot/install/setup.zsh;/home/mech-user/ping-pong-robot/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mech-user/ping-pong-robot/install" TYPE FILE FILES
    "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/setup.zsh"
    "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mech-user/ping-pong-robot/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mech-user/ping-pong-robot/install" TYPE FILE FILES "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/.rosinstall")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kxr_controller/action" TYPE FILE FILES
    "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/action/ServoOnOff.action"
    "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/action/AdjustAngleVector.action"
    "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/action/Stretch.action"
    "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/action/PressureControl.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kxr_controller/msg" TYPE FILE FILES
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffAction.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionGoal.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionResult.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffActionFeedback.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffGoal.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffResult.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/ServoOnOffFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kxr_controller/msg" TYPE FILE FILES
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorAction.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionGoal.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionResult.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorActionFeedback.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorGoal.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorResult.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/AdjustAngleVectorFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kxr_controller/msg" TYPE FILE FILES
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchAction.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionGoal.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionResult.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchActionFeedback.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchGoal.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchResult.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/StretchFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kxr_controller/msg" TYPE FILE FILES
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlAction.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionGoal.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionResult.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlActionFeedback.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlGoal.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlResult.msg"
    "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/kxr_controller/msg/PressureControlFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kxr_controller/msg" TYPE FILE FILES
    "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/Stretch.msg"
    "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoOnOff.msg"
    "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/PressureControl.msg"
    "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoState.msg"
    "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/msg/ServoStateArray.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kxr_controller" TYPE FILE FILES "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/include/kxr_controller/KXRParameteresConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/lib/python3/dist-packages/kxr_controller/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/kxr_controller" TYPE DIRECTORY FILES "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/lib/python3/dist-packages/kxr_controller/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kxr_controller/cmake" TYPE FILE FILES "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/kxr_controller-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/include/kxr_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/roseus/ros/kxr_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/common-lisp/ros/kxr_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/share/gennodejs/ros/kxr_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/lib/python3/dist-packages/kxr_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/lib/python3/dist-packages/kxr_controller" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/lib/python3/dist-packages/kxr_controller" FILES_MATCHING REGEX "/home/mech-user/ping-pong-robot/devel/\\.private/kxr_controller/lib/python3/dist-packages/kxr_controller/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/kxr_controller.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kxr_controller/cmake" TYPE FILE FILES "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/kxr_controller-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kxr_controller/cmake" TYPE FILE FILES
    "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/kxr_controllerConfig.cmake"
    "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/kxr_controllerConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kxr_controller" TYPE FILE FILES "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/kxr_controller" TYPE PROGRAM FILES "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/rcb4_ros_bridge.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/kxr_controller" TYPE PROGRAM FILES "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/interface.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/kxr_controller" TYPE PROGRAM FILES "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/kxr_controller.test")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/kxr_controller" TYPE PROGRAM FILES "/home/mech-user/ping-pong-robot/build/kxr_controller/catkin_generated/installspace/test_kxr_controller.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kxr_controller" TYPE FILE FILES "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/requirements.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/kxr_controller/kxr_controller" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/kxr_controller/kxr_controller")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/kxr_controller/kxr_controller"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/kxr_controller" TYPE EXECUTABLE FILES "/home/mech-user/ping-pong-robot/devel/.private/kxr_controller/lib/kxr_controller/kxr_controller")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/kxr_controller/kxr_controller" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/kxr_controller/kxr_controller")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/kxr_controller/kxr_controller"
         OLD_RPATH "/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/kxr_controller/kxr_controller")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kxr_controller/launch" TYPE DIRECTORY FILES "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/launch/")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mech-user/ping-pong-robot/build/kxr_controller/gtest/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/mech-user/ping-pong-robot/build/kxr_controller/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
