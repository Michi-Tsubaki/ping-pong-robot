#include <controller_manager/controller_manager.h>
#include <ros/ros.h>

#include "kxr_controller/kxr_robot_hardware.h"  //<realhw_control/realhw.h>

using namespace kxr_controller;

int main(int argc, char *argv[]) {
    ros::init(argc, argv, "kxr_ros_controller");

    KXRRobotHW hw;

    ros::NodeHandle nh;
    ros::NodeHandle robot_nh("~");

    if (!hw.init(nh, robot_nh)) {
        ROS_ERROR("Failed to initialize hardware");
        exit(1);
    }

    controller_manager::ControllerManager cm(&hw, hw.nh_);

    ros::Rate rate(1 / hw.getPeriod().toSec());
    ros::AsyncSpinner spinner(1);
    spinner.start();

    while (ros::ok()) {
        ros::Time now = hw.getTime();
        ros::Duration dt = hw.getPeriod();

        hw.read(now, dt);
        cm.update(now, dt);
        hw.write(now, dt);
        rate.sleep();
    }
    spinner.stop();

    return 0;
}
