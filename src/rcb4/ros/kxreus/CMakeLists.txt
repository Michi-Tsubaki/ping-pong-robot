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

