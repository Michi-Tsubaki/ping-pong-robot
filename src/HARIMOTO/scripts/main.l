#!/usr/bin/env roseus

(ros::roseus "ping-pong")
;;load packages
(load "HARIMOTO-interface.l")
(ros::load-ros-package "jsk_recognition_msgs")

;;basic setting
(ros::rate 10)
(setq *ball-lost* t)

;;basic function
;;サーボ系
(defun servo-on()
  (send *ri* :servo-on)
  )
(defun servo-off()
  (send *ri* :servo-off)
  )
(defun wait-pose()
  (send *ri* :angle-vector #f(-70 28 -44 70) 5000)
  )
(defun keep()
  (setq *tmp* (send *ri* :state :angle-vector))
  (send *ri* :angle-vector (send *ri* :state :angle-vector) 100)
  (send *ri* :wait-interpolation)
  (send *irtviewer* :draw-objects)
  (send *ri* :servo-on)
  )


;;認識系
(defun search-ball()
  (ros::ros-info "search-ball")
  (ros::rate 100)
  (ros::subscribe "detect_ball/cluster_decomposer/boxes" jsk_recognition_msgs::BoundingBoxArray #'search-ball-cb)
  )

(defun search-ball-cb(msg)
  (ros::ros-info "recog: ~A balls found!  ~%" (length (send msg :boxes)))
  (if (and (> (length (send msg :boxes)) 0) (> (send (send (elt (send msg :boxes) 0) :dimensions) :x) 0) )
      (progn (setq *ball-xpos* (send (send (send (elt (send msg :boxes) 0) :pose) :position) :x))
	     (setq *ball-ypos* (send (send (send (elt (send msg :boxes) 0) :pose) :position) :y))
	     (setq *ball-zpos* (send (send (send (elt (send msg :boxes) 0) :pose) :position) :z))
	     (ros::ros-info "ball: x-pos:~A y-pos:~A z-pos:~A" *ball-xpos* *ball-ypos* *ball-zpos*)
	     (setq *ball-lost* nil)
	     )
    )
  )


;;motion
(defun back-drive()
  (setq r1 #f(-29.5312 35.2688 -32.5687 54.54))
  (setq r2 #f(-29.1937 28.08 -12.7575 54.2363))
  (setq r3 #f(-34.56 15.9975 9.45001 55.215))
  (setq r4 #f(-30 7.15501 26.46 46.3725))
  (setq r5 #f(-30 7.15501 40.107 44.0775))
  (setq r6 #f(-70 28 -44 70))
  (setq tm 80)
  (send *ri* :angle-vector-sequence (list r1 r2 r3 r4 r5 r6) (list tm tm tm tm tm 1500)
	:default-controller 0.001
	:min-time 0.0001
	:minjerk-interpolation t
	)
  (send *ri* :wait-interpolation)
  (send *irtviewer* :draw-objects)
  )
  
;;音声系

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;main
(hari-init)
(servo-on)
(send *ri* :angle-vector (send *hari* :angle-vector) 2000)
(back-drive)