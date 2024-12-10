import rospy


def get_namespace():
    full_namespace = rospy.get_namespace()
    last_slash_pos = full_namespace.rfind("/")
    clean_namespace = full_namespace[:last_slash_pos] if last_slash_pos != 0 else ""
    return clean_namespace
