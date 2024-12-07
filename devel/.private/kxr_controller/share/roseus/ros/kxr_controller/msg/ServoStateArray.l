;; Auto-generated. Do not edit!


(when (boundp 'kxr_controller::ServoStateArray)
  (if (not (find-package "KXR_CONTROLLER"))
    (make-package "KXR_CONTROLLER"))
  (shadow 'ServoStateArray (find-package "KXR_CONTROLLER")))
(unless (find-package "KXR_CONTROLLER::SERVOSTATEARRAY")
  (make-package "KXR_CONTROLLER::SERVOSTATEARRAY"))

(in-package "ROS")
;;//! \htmlinclude ServoStateArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass kxr_controller::ServoStateArray
  :super ros::object
  :slots (_header _servos ))

(defmethod kxr_controller::ServoStateArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:servos __servos) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _servos __servos)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:servos
   (&rest __servos)
   (if (keywordp (car __servos))
       (send* _servos __servos)
     (progn
       (if __servos (setq _servos (car __servos)))
       _servos)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; kxr_controller/ServoState[] _servos
    (apply #'+ (send-all _servos :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; kxr_controller/ServoState[] _servos
     (write-long (length _servos) s)
     (dolist (elem _servos)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; kxr_controller/ServoState[] _servos
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _servos (let (r) (dotimes (i n) (push (instance kxr_controller::ServoState :init) r)) r))
     (dolist (elem- _servos)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get kxr_controller::ServoStateArray :md5sum-) "c49987abc073bf0afcf190de7df7c47c")
(setf (get kxr_controller::ServoStateArray :datatype-) "kxr_controller/ServoStateArray")
(setf (get kxr_controller::ServoStateArray :definition-)
      "Header header
ServoState[] servos

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: kxr_controller/ServoState
std_msgs/Header header
string name
float64 position
float64 error
float64 temperature
float64 current

")



(provide :kxr_controller/ServoStateArray "c49987abc073bf0afcf190de7df7c47c")


