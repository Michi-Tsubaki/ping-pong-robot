cmake_minimum_required(VERSION 2.8.3)

project(kxr_models)

find_package(catkin REQUIRED)

catkin_python_setup()

catkin_package()

file(GLOB PYTHON_SCRIPT_FILES scripts/* node_scripts/*)
catkin_install_python(
  PROGRAMS ${PYTHON_SCRIPT_FILES}
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

find_package(roslaunch)
foreach(dir config meshes urdf models)
	install(DIRECTORY ${dir}/
		DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/${dir})
endforeach(dir)
