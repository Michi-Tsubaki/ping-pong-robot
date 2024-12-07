#!/usr/bin/env roseus

(ros::roseus-add-msgs "std_msgs")
(ros::roseus-add-msgs "sensor_msgs")
(load "package://kxreus/euslisp/kxr-interface.l")
(load "package://HARIMOTO/urdf/HARIMOTO.l")


(defun calc-yaw-pitch-roll (linear-acceleration)
  (let* ((x (send linear-acceleration :x))
         (y (send linear-acceleration :y))
         (z (send linear-acceleration :z))
         ;; 各角度の計算 (radian単位)
         (roll (atan (- x) (sqrt (+ (* y y) (* z z)))))
         (pitch (atan y z))
         (yaw 0))  ;; Yawは加速度だけでは計算できないので、0を仮定

    ;; 結果をdegreeにして次の順序で返す (roll, pitch, yaw)
    (list (rad2deg roll) (rad2deg pitch) (rad2deg yaw))))


(defclass hari-interface
  :super kxr-interface
  :slots (atom-s3-button-click-count atom-s3-additional-info-topic-name imu-raw-msg))

(defmethod hari-interface
  (:init (robot &rest args &key (namespace nil)
                (type :default-controller)
                (controller-name "fullbody_controller") &allow-other-keys)
   (send-super* :init robot :type type
                :namespace namespace
                :controller-name controller-name
                :input-joint-names (list "upper_shoulder"
                                         "lower_shoulder"
                                         "upper_arm"
                                         "lower_arm")
                args)
   (setq atom-s3-button-click-count 0)
   (setq atom-s3-additional-info-topic-name (if namespace (format nil "~A/atom_s3_additional_info" namespace)
                                                                          "/atom_s3_additional_info"))
   (ros::advertise atom-s3-additional-info-topic-name std_msgs::String 1)
   (ros::subscribe (if namespace (format nil "~A/atom_s3_button_state" namespace)
                       "/atom_s3_button_state") std_msgs::Int32
                       #'send self :atom-s3-button-state-callback :groupname groupname)
   (setq imu-raw-msg (instance sensor_msgs::Imu :init))
   (ros::subscribe (if namespace (format nil "~A/imu_publisher/imu" namespace)
                       "/imu_publisher/imu") sensor_msgs::Imu
                       #'send self :atom-s3-imu-callback :groupname groupname)
   (ros::ros-info "Initializing jedy-interface"))
  (:state (&rest args) ;; overwrite robot-interface
          (case (car args)
            (:atom-s3-button
             (let ((button-value atom-s3-button-click-count))
               (setq atom-s3-button-click-count 0)
               button-value))
            (:imu
             imu-raw-msg)
            (:roll-pitch-yaw
             (calc-yaw-pitch-roll (send imu-raw-msg :linear_acceleration)))
            (t
             (send-super* :state args))
            ))
  )


(defun hari-init (&key
                   (namespace nil)
                   (without-ri nil)
                   (create-viewer t)
                   (controller-name "fullbody_controller"))
  (unless (boundp '*hari*)
    (setq *hari* (HARIMOTO)))
  (unless without-ri
    (unless (ros::ok) (ros::roseus "HARIMOTO_eus_interface"))
    (unless (boundp '*ri*)
      (setq *ri* (instance hari-interface :init *hari* :namespace namespace
                           :controller-name controller-name)))

    (ros::spin-once)
    (send *ri* :spin-once)
    (send *hari* :angle-vector (send *ri* :state :potentio-vector)))
  (when create-viewer (objects (list *hari*))))

(defun servo-off-sequence ()
  (send *ri* :angle-vector (send *hari* :reset-pose) 5000)
  (send *ri* :wait-interpolation)
  (send *ri* :servo-off))