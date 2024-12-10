# kxr controller

## Building the Package

### Using the Python Virtual Environment (Recommended)

Ensure you have all the necessary dependencies installed.

Navigate to the root of your workspace and run the following commands:

```
catkin build kxr_controller
```

### Disabling the Python Virtual Environment (Not Recommended)

Disabling the virtual environment can shorten the build time,
but it is generally not recommended. If you choose to proceed, follow these steps:

Navigate to the root of your workspace and run the following commands:

```
catkin b kxr_controller --cmake-args -DUSE_VIRTUALENV=OFF
```

Additionally, navigate to the rcb4 directory and install the package using pip:

```
cd rcb4
pip3 install -e .
```
