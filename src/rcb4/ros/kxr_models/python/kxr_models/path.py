import functools
import os.path as osp
from urllib.parse import urlparse

import rospkg


@functools.lru_cache(maxsize=None)
def get_path_with_cache(ros_package):
    rospack = rospkg.RosPack()
    return rospack.get_path(ros_package)


def resolve_filepath(file_path, urdf_path):
    if file_path.startswith("file://") and osp.exists(file_path[7:]):
        return file_path[7:]

    parsed_url = urlparse(file_path)
    if rospkg and parsed_url.scheme == "package":
        try:
            ros_package = parsed_url.netloc
            package_path = get_path_with_cache(ros_package)
            resolve_filepath = package_path + parsed_url.path
            if osp.exists(resolve_filepath):
                return resolve_filepath
        except rospkg.common.ResourceNotFound:
            pass

    base_path = osp.abspath(urdf_path)
    dirname = base_path
    file_path = parsed_url.netloc + parsed_url.path
    while dirname and dirname != "/":
        resolved_filepath = osp.join(dirname, file_path)
        if osp.exists(resolved_filepath):
            return resolved_filepath
        dirname = osp.dirname(dirname)
    return None
