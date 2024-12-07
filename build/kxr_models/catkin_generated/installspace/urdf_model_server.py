#!/usr/bin/env python3

import os
import tempfile
import xml.etree.ElementTree as ET

from filelock import FileLock
from kxr_models.md5sum_utils import checksum_md5
from kxr_models.urdf import aggregate_urdf_mesh_files
import rospkg
import rospy


class URDFModelServer:
    def __init__(self):
        full_namespace = rospy.get_namespace()
        last_slash_pos = full_namespace.rfind("/")
        self.clean_namespace = (
            full_namespace[:last_slash_pos] if last_slash_pos != 0 else ""
        )

    def set_urdf_hash(self, md5sum, urdf_data):
        rospy.set_param(self.clean_namespace + "/urdf_hash", md5sum)
        rospy.set_param(self.clean_namespace + "/robot_description_viz", urdf_data)

    def run(self):
        rate = rospy.Rate(1)
        rospack = rospkg.RosPack()
        kxr_models_path = rospack.get_path("kxr_models")
        previous_urdf = None

        while not rospy.is_shutdown():
            rate.sleep()
            urdf = rospy.get_param(self.clean_namespace + "/robot_description", None)

            if urdf == previous_urdf or urdf is None:
                continue

            previous_urdf = urdf
            with tempfile.NamedTemporaryFile(
                "w", suffix=".urdf", delete=False
            ) as temp_file:
                temp_file.write(urdf)
                urdf_path = temp_file.name

            md5sum = checksum_md5(urdf_path)
            compressed_urdf_path = os.path.join(
                kxr_models_path, "models", "urdf", f"{md5sum}.tar.gz"
            )

            if os.path.exists(compressed_urdf_path):
                self._update_robot_description(urdf_path, md5sum, kxr_models_path)
                continue

            lock_path = compressed_urdf_path + ".lock"
            with FileLock(lock_path, timeout=10):
                aggregate_urdf_mesh_files(
                    urdf_path,
                    os.path.join(kxr_models_path, "models", "urdf"),
                    compress=True,
                )
                rospy.loginfo(f"Compressed URDF model saved to {compressed_urdf_path}")
                self._update_robot_description(urdf_path, md5sum, kxr_models_path)

            os.remove(urdf_path)

    def _update_robot_description(self, urdf_path, md5sum, kxr_models_path):
        parser = ET.XMLParser(target=ET.TreeBuilder(insert_comments=True))
        tree = ET.parse(urdf_path, parser)
        root = tree.getroot()
        robot_name = root.get("name", "default_robot")
        with open(urdf_path) as urdf_file:
            urdf_data = urdf_file.read()
        self.set_urdf_hash(md5sum, urdf_data)
        rospy.loginfo(f"Updated robot description for {robot_name}")


if __name__ == "__main__":
    rospy.init_node("urdf_model_server")
    server = URDFModelServer()
    server.run()
