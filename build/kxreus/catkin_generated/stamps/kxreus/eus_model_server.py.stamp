#!/usr/bin/env python

from contextlib import contextmanager
import os
import tempfile

from filelock import FileLock
from kxr_models.md5sum_utils import checksum_md5
import rospkg
import rospy
from skrobot.model import RobotModel
from skrobot.utils.urdf import no_mesh_load_mode
from urdfeus.urdf2eus import urdf2eus
import yaml


class EusModelServer:
    def __init__(self):
        self.namespace = self._get_clean_namespace()
        self.kxr_models_path = rospkg.RosPack().get_path("kxr_models")
        self.previous_md5sum = None
        self.robot_model = None

    def _get_clean_namespace(self):
        full_namespace = rospy.get_namespace()
        last_slash_pos = full_namespace.rfind("/")
        return full_namespace[:last_slash_pos] if last_slash_pos != 0 else ""

    @staticmethod
    def load_robot_model(urdf_content):
        """Load URDF content into a RobotModel instance."""
        r = RobotModel()
        with EusModelServer.temp_file() as urdf_file:
            with open(urdf_file, "w") as f:
                f.write(urdf_content)
            with open(urdf_file) as f, no_mesh_load_mode():
                r.load_urdf_file(f)
        return r

    @staticmethod
    @contextmanager
    def temp_file(suffix=""):
        temp = tempfile.mktemp(suffix=suffix)
        try:
            yield temp
        finally:
            if os.path.exists(temp):
                os.remove(temp)

    def get_md5sum(self, urdf_content, joint_group_description):
        with self.temp_file() as urdf_file:
            with open(urdf_file, "w") as f:
                f.write(urdf_content)
            md5sum = checksum_md5(urdf_file)

        if joint_group_description:
            with self.temp_file(suffix=".yaml") as yaml_file:
                with open(yaml_file, "w") as f:
                    yaml.dump(joint_group_description, f)
                md5sum += "-" + checksum_md5(yaml_file)

        return md5sum

    def save_eus_model(self, md5sum, urdf_content, joint_group_description):
        eus_path = os.path.join(self.kxr_models_path, "models", "euslisp", f"{md5sum}.l")
        if os.path.exists(eus_path):
            return eus_path  # Model already exists

        lock = FileLock(eus_path + ".lock", timeout=10)
        with lock:
            with self.temp_file() as urdf_file:
                with open(urdf_file, "w") as f:
                    f.write(urdf_content)
                with open(eus_path, "w") as f:
                    urdf2eus(urdf_file, config_yaml_path=joint_group_description, fp=f)
            rospy.loginfo(f"Eusmodel is saved to {eus_path}")
        return eus_path

    def run(self):
        rate = rospy.Rate(1)

        while not rospy.is_shutdown():
            rate.sleep()
            urdf_content = rospy.get_param(self.namespace + "/robot_description", None)
            if urdf_content:
                joint_group_description = rospy.get_param(
                    self.namespace + "/joint_group_description", None
                )
                md5sum = self.get_md5sum(urdf_content, joint_group_description)

                if self.previous_md5sum != md5sum:
                    self.robot_model = self.load_robot_model(urdf_content)
                    self.previous_md5sum = md5sum

                self.save_eus_model(md5sum, urdf_content, joint_group_description)
                robot_name = self.robot_model.urdf_robot_model.name

                rospy.set_param(self.namespace + "/eus_robot_name", robot_name)
                rospy.set_param(self.namespace + "/eusmodel_hash", md5sum)


if __name__ == "__main__":
    rospy.init_node("model_server")
    server = EusModelServer()
    server.run()
