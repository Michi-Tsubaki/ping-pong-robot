#!/usr/bin/env roseus

;; SPDX-FileCopyrightText: 2024 Michitoshi Tsubaki <michi.tsubaki.tech@g.ecc.u-tokyo.ac.jp>
;; SPDX-License-Identifier: BSD-3-Clause

;; Build node ping-pong
(ros::roseus "ping-pong")

;; Load packages
(load "HARIMOTO-interface.l")
(ros::load-ros-package "jsk_recognition_msgs")

;; parameters
(setq *ball-x-min-lim* 0.10) ;;奥行き方向
(setq *ball-x-max-lim* 0.30)
(setq *ball-y-min-lim* -0.15) ;;左右方向
(setq *ball-y-max-lim* 0.15)
(setq *ball-z-min-lim* 0.20) ;;上下方向
(setq *ball-z-max-lim* -0.20)


;; Basic setting
(setq *ball-lost* t)

;; Basic function
;;サーボ系
(defun on()
  (send *ri* :servo-on)
  )
(defun off()
  (send *ri* :servo-off)
  )
(defun wait-pose()
  (send *ri* :angle-vector #f(-70 28 -44 70) 5000)
  (send *ri* :wait-interpolation)
  (send *irtviewer* :draw-objects)
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
  (format t "search-ball~%")
  (ros::rate 100)
  (ros::subscribe "/detect_ball/cluster_decomposer/boxes" jsk_recognition_msgs::BoundingBoxArray #'search-ball-cb)
  (ros::spin-once)
  )

(defun search-ball-cb(msg)
  (ros::ros-info "recog: ~A balls found!  ~%" (length (send msg :boxes)))
  (if (and (> (length (send msg :boxes)) 0) (> (send (send (elt (send msg :boxes) 0) :dimensions) :x) 0) )
      (progn (ros::ros-info "recog: ~A balls found!  ~%" (length (send msg :boxes)))
	     (setq *ball-xpos* (send (send (send (elt (send msg :boxes) 0) :pose) :position) :x))
	     (setq *ball-ypos* (send (send (send (elt (send msg :boxes) 0) :pose) :position) :y))
	     (setq *ball-zpos* (send (send (send (elt (send msg :boxes) 0) :pose) :position) :z))
	     ;;(ros::ros-info "ball: x-pos:~A y-pos:~A z-pos:~A" *ball-xpos* *ball-ypos* *ball-zpos*)
	     )
    (ros::ros-info "no ball found! ~%")
    )
  )

;;motion
(defun back-drive() ;;TODO: yとzを引数にしてもう少し複雑にする
  (setq r1 #f(-29.5312 35.2688 -32.5687 54.54))
  (setq r2 #f(-29.1937 28.08 -12.7575 54.2363))
  (setq r3 #f(-34.56 15.9975 9.45001 55.215))
  (setq r4 #f(-30 7.15501 26.46 46.3725))
  (setq r5 #f(-30 7.15501 40.107 44.0775))
  (setq r6 #f(-70 28 -44 70))
  (setq tm 60)
  (send *ri* :angle-vector-sequence (list r1 r2 r3 r4 r5 r6) (list tm tm tm tm tm 1500)
	:default-controller 0.001
	:min-time 0.0001
	:minjerk-interpolation t
	)
  (send *ri* :wait-interpolation)
  (send *irtviewer* :draw-objects)
  )
  
;;音声系
(defun chorei()
    ;;
    )
;;Initialize
(setq *ball-xpos* 0)
(setq *ball-ypos* 0)
(setq *ball-zpos* 0)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;main
(hari-init)
(on)
(setq *ball-lost* 1)
(unix:sleep 1)
(wait-pose)
(search-ball)
(do-until-key
 (setq *ball-lost* t)
 (setq *ball-xpos-tmp* 0)
 (setq *ball-ypos-tmp* 0)
 (setq *ball-zpos-tmp* 0)
 (setq *ball-xpos* 0)
 (setq *ball-ypos* 0)
 (setq *ball-zpos* 0)
 (while *ball-lost*
   (progn (ros::rate 1000)	  
	  (ros::spin-once)
	  (setq *ball-xpos-tmp* *ball-xpos*)
	  (setq *ball-ypos-tmp* *ball-ypos*)
	  (setq *ball-zpos-tmp* *ball-zpos*)
	  (format t "x: ~A, y: ~A, z: ~A~%" *ball-xpos-tmp* *ball-ypos-tmp* *ball-zpos-tmp*)
	  (if (and (> *ball-xpos-tmp* *ball-x-min-lim*)
		   (< *ball-xpos-tmp* *ball-x-max-lim*)
		   (> *ball-ypos-tmp* *ball-y-min-lim*)
		   (< *ball-ypos-tmp* *ball-y-max-lim*)
		   (> *ball-zpos-tmp* *ball-z-min-lim*)
		   (< *ball-zpos-tmp* *ball-z-max-lim*))
	      (setq *ball-lost* nil)
	    )
	  )
   )
 (back-drive)
 (ros::sleep)
 (unix:sleep 1)
 )
(off)
