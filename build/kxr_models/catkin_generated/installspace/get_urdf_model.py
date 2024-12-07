#!/usr/bin/env python3

from kxr_models.download_urdf import download_urdf_mesh_files
from kxr_models.ros import get_namespace
import rospy
import tf
from urdf_parser_py.urdf import URDF

if __name__ == "__main__":
    rospy.init_node("get_urdf_model")

    clean_namespace = get_namespace()
    download_urdf_mesh_files()

    if rospy.get_param("~connect_tf", False):
        robot = URDF.from_parameter_server(key=clean_namespace + "/robot_description")
        root_link = robot.get_root()

        rate = rospy.Rate(rospy.get_param("~rate", 20))
        while not rospy.is_shutdown():
            br = tf.TransformBroadcaster()
            br.sendTransform((0, 0, 0), (0, 0, 0, 1), rospy.Time.now(), root_link, "map")
            rate.sleep()
