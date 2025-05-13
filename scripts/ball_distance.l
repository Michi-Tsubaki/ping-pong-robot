#!/usr/bin/env roseus

(ros::roseus "ball_distance")
(ros::roseus-add-msgs "geometry_msgs")
(ros::roseus-add-msgs "opencv_apps")
(ros::advertise "ball_distance" geometry_msgs::Pose 1)

(defun cal-distance(r)
  (- (/ 1590.18  r) 0.3886) ;; result of LSM fitting.
  )

(defun callback(sub_msg)
  (let ((*radius* (send (elt (send sub_msg :circles) 0) :radius)))
    (setq pub_msg (instance geometry_msgs::Pose :init))
    (send pub_msg :x (send (send (elt (send sub_msg :circles) 0) :center) :x))
    (send pub_msg :y (send (send (elt (send sub_msg :circles) 0) :center) :y))
    (send pub_msg :z (cal-distance *radius*))
    (ros::ros-info "The distance of a ball is [~A] cm" (send msg :z))
    (ros::publish "ping-pong/ball_distance" pub_msg)
    )
  )
 
(ros::subscribe "ball_datection/hough_circles/circles" opencv_apps::CircleArrayStamped #'callback)

(ros::rate 100)
(while (ros::ok)
  (ros::spin-once)
  (ros::sleep)
  )
  
		 
