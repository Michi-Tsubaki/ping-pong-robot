#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/mech-user/ping-pong-robot/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/mech-user/ping-pong-robot/install/lib/python3/dist-packages:/home/mech-user/ping-pong-robot/build/kxr_controller/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/mech-user/ping-pong-robot/build/kxr_controller" \
    "/usr/bin/python3" \
    "/home/mech-user/ping-pong-robot/src/rcb4/ros/kxr_controller/setup.py" \
    egg_info --egg-base /home/mech-user/ping-pong-robot/build/kxr_controller \
    build --build-base "/home/mech-user/ping-pong-robot/build/kxr_controller" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/mech-user/ping-pong-robot/install" --install-scripts="/home/mech-user/ping-pong-robot/install/bin"
