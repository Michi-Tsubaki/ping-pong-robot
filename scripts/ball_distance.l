(ros::roseus "ball_distance")
(ros::roseus-add-msgs "geometry_msgs")

(ros::advertise "ping-pong/ball_distance" geometry_msgs::Pose 1)
