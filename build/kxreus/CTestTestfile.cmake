# CMake generated Testfile for 
# Source directory: /home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus
# Build directory: /home/mech-user/ping-pong-robot/build/kxreus
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_kxreus_roslaunch-check__home_mech-user_ping-pong-robot_src_rcb4_ros_kxreus_launch_eusmodel_server.launch "/home/mech-user/ping-pong-robot/build/kxreus/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/mech-user/ping-pong-robot/build/kxreus/test_results/kxreus/roslaunch-check__home_mech-user_ping-pong-robot_src_rcb4_ros_kxreus_launch_eusmodel_server.launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/mech-user/ping-pong-robot/build/kxreus/test_results/kxreus" "/opt/ros/noetic/share/roslaunch/cmake/../scripts/roslaunch-check -o \"/home/mech-user/ping-pong-robot/build/kxreus/test_results/kxreus/roslaunch-check__home_mech-user_ping-pong-robot_src_rcb4_ros_kxreus_launch_eusmodel_server.launch.xml\" \"/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/launch/eusmodel_server.launch\" ")
set_tests_properties(_ctest_kxreus_roslaunch-check__home_mech-user_ping-pong-robot_src_rcb4_ros_kxreus_launch_eusmodel_server.launch PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/roslaunch/cmake/roslaunch-extras.cmake;66;catkin_run_tests_target;/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/CMakeLists.txt;36;roslaunch_add_file_check;/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/CMakeLists.txt;0;")
add_test(_ctest_kxreus_rostest_kxreus__namespace_"".test "/home/mech-user/ping-pong-robot/build/kxreus/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/mech-user/ping-pong-robot/build/kxreus/test_results/kxreus/rostest-kxreus__namespace_\"\".xml" "--return-code" "/usr/bin/python3 /opt/ros/noetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus --package=kxreus --results-filename kxreus__namespace_\"\".xml --results-base-dir \"/home/mech-user/ping-pong-robot/build/kxreus/test_results\" /home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/test/kxreus.test namespace:=\"\"")
set_tests_properties(_ctest_kxreus_rostest_kxreus__namespace_"".test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/CMakeLists.txt;39;add_rostest;/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/CMakeLists.txt;0;")
add_test(_ctest_kxreus_rostest_kxreus__namespace_"robot_a".test "/home/mech-user/ping-pong-robot/build/kxreus/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/mech-user/ping-pong-robot/build/kxreus/test_results/kxreus/rostest-kxreus__namespace_\"robot_a\".xml" "--return-code" "/usr/bin/python3 /opt/ros/noetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus --package=kxreus --results-filename kxreus__namespace_\"robot_a\".xml --results-base-dir \"/home/mech-user/ping-pong-robot/build/kxreus/test_results\" /home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/test/kxreus.test namespace:=\"robot_a\"")
set_tests_properties(_ctest_kxreus_rostest_kxreus__namespace_"robot_a".test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/CMakeLists.txt;40;add_rostest;/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/CMakeLists.txt;0;")
add_test(_ctest_kxreus_rostest_kxreus__namespace_""__use_rcb4_true.test "/home/mech-user/ping-pong-robot/build/kxreus/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/mech-user/ping-pong-robot/build/kxreus/test_results/kxreus/rostest-kxreus__namespace_\"\"__use_rcb4_true.xml" "--return-code" "/usr/bin/python3 /opt/ros/noetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus --package=kxreus --results-filename kxreus__namespace_\"\"__use_rcb4_true.xml --results-base-dir \"/home/mech-user/ping-pong-robot/build/kxreus/test_results\" /home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/test/kxreus.test namespace:=\"\" use_rcb4:=true")
set_tests_properties(_ctest_kxreus_rostest_kxreus__namespace_""__use_rcb4_true.test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/CMakeLists.txt;41;add_rostest;/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/CMakeLists.txt;0;")
add_test(_ctest_kxreus_rostest_kxreus__namespace_"robot_a"__use_rcb4_true.test "/home/mech-user/ping-pong-robot/build/kxreus/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/mech-user/ping-pong-robot/build/kxreus/test_results/kxreus/rostest-kxreus__namespace_\"robot_a\"__use_rcb4_true.xml" "--return-code" "/usr/bin/python3 /opt/ros/noetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus --package=kxreus --results-filename kxreus__namespace_\"robot_a\"__use_rcb4_true.xml --results-base-dir \"/home/mech-user/ping-pong-robot/build/kxreus/test_results\" /home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/test/kxreus.test namespace:=\"robot_a\" use_rcb4:=true")
set_tests_properties(_ctest_kxreus_rostest_kxreus__namespace_"robot_a"__use_rcb4_true.test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/CMakeLists.txt;42;add_rostest;/home/mech-user/ping-pong-robot/src/rcb4/ros/kxreus/CMakeLists.txt;0;")
subdirs("gtest")