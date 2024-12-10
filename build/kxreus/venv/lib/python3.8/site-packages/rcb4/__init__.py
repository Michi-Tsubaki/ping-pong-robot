# flake8: noqa

import sys
import pkg_resources


if sys.version_info[0] < 3:
    print("\033[91mThis package is not supported in Python 2.\033[0m")
    sys.exit(1)

__version__ = pkg_resources.get_distribution("rcb4").version
