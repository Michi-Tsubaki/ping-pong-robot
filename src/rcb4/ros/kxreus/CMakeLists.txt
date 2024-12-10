cmake_minimum_required(VERSION 2.8.3)
project(kxreus)

find_package(catkin REQUIRED
  catkin_virtualenv
  kxr_models
)

catkin_package(
  DEPENDS
  LIBRARIES ${PROJECT_NAME}
)

catkin_generate_virtualenv(
  INPUT_REQUIREMENTS requirements.in
  PYTHON_INTERPRETER python3
  USE_SYSTEM_PACKAGES TRUE
  ISOLATE_REQUIREMENTS FALSE
  CHECK_VENV FALSE
)

file(GLOB PYTHON_SCRIPT_FILES node_scripts/*)
catkin_install_python(
  PROGRAMS ${PYTHON_SCRIPT_FILES}
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})


if(CATKIN_ENABLE_TESTING)
  find_package(rostest REQUIRED)
  find_package(roslaunch REQUIRED)
  if(roslaunch_VERSION VERSION_LESS "1.11.1")
    message(WARNING "roslaunch_add_file check fails with unsupported doc attributes ${roslaunch_VERSION}")
  else()
    file(GLOB LAUNCH_FILES launch/*.launch)
    foreach(LAUNCH_FILE ${LAUNCH_FILES})
      roslaunch_add_file_check(${LAUNCH_FILE})
    endforeach()
  endif()
  add_rostest(test/kxreus.test ARGS namespace:="")
  add_rostest(test/kxreus.test ARGS namespace:="robot_a")
  add_rostest(test/kxreus.test ARGS namespace:="" use_rcb4:=true)
  add_rostest(test/kxreus.test ARGS namespace:="robot_a" use_rcb4:=true)
endif()
