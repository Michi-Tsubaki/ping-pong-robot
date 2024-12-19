#!/usr/bin/env python3


import argparse

import IPython
from kxr_controller.kxr_interface import KXRROSRobotInterface
from kxr_models.download_urdf import download_urdf_mesh_files
import numpy as np  # NOQA
import rospy
from skrobot.model import RobotModel


def main():
    parser = argparse.ArgumentParser(description="Run KXRROSRobotInterface")
    parser.add_argument(
        "--viewer", type=str, help="Specify the viewer: trimesh", default=None
    )
    parser.add_argument(
        "--namespace", type=str, help="Specify the ROS namespace", default=""
    )
    args = parser.parse_args()

    rospy.init_node("kxr_interface", anonymous=True)

    download_urdf_mesh_files(args.namespace)

    robot_model = RobotModel()
    robot_model.load_urdf_from_robot_description(
        args.namespace + "/robot_description_viz"
    )
    ri = KXRROSRobotInterface(  # NOQA
        robot_model, namespace=args.namespace, controller_timeout=60.0
    )

    if args.viewer is not None:
        if args.viewer == "trimesh":
            from skrobot.viewers import TrimeshSceneViewer

            viewer = TrimeshSceneViewer(resolution=(640, 480))
            viewer.add(robot_model)
            viewer.show()
        elif args.viewer == "pyrender":
            from skrobot.viewers import PyrenderViewer

            viewer = PyrenderViewer(resolution=(640, 480))
            viewer.add(robot_model)
            viewer.show()
        else:
            raise NotImplementedError(f"Not supported viewer {args.viewer}")

    # Drop into an IPython shell
    IPython.embed()  # NOQA


if __name__ == "__main__":
    main()
