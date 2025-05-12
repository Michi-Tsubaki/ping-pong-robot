#!/usr/bin/env roseus
(ros::roseus "ball_distance")
(ros::roseus-add-msgs "geometry_msgs")
(ros::roseus-add-msgs "opencv_apps")
(ros::advertise "hough_ball_position" geometry_msgs::PointStamped 1)

(defun cal-distance(r)
  (- (/ 1590.18  r) 0.3886) ;; result of LSM fitting.
  )

(defun callback(sub_msg)
  (let ((circles (send sub_msg :circles)))
    (if (and circles (consp circles) (> (length circles) 0))
        (let ((circle (elt circles 0))
              (pub_msg (instance geometry_msgs::PointStamped :init)))
          (if (send circle :center)
              (let ((center (send circle :center)))
                (setq *radius* (send circle :radius))
                (setq *pre-x* (- (send center :x) 640))
                (setq *scale-x* (/ (* (cal-distance *radius*) 0.725) 640))
                (setq *x* (* *pre-x* *scale-x*))
                (setq *pre-y* (- (send center :y) 360))
                (setq *scale-y* (/ (* (cal-distance *radius*) 0.43) 360))
                (setq *y* (* *pre-y* *scale-y*))

                (send pub_msg :header :stamp (send sub_msg :header :stamp))
                (send pub_msg :header :frame_id "camera_link")
                (send pub_msg :point :x (* *x* 0.01))
                (send pub_msg :point :y (* *y* 0.01))
                (send pub_msg :point :z (* (cal-distance *radius*) 0.01))

                (ros::ros-info "Ball position x:~A, y:~A, z:~A [m]"
                               (send pub_msg :point :x)
                               (send pub_msg :point :y)
                               (send pub_msg :point :z))

                (ros::publish "hough_ball_position" pub_msg))
            (ros::ros-warn "No circle center detected")))
      (ros::ros-warn "No circles detected"))))


;; Subscription
(ros::subscribe "ball_detection/hough_circles/circles" opencv_apps::CircleArrayStamped #'callback)

(ros::rate 100)

(while (ros::ok)
  (ros::spin-once)
  (ros::sleep)
  )
		 
