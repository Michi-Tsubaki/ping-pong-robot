; Auto-generated. Do not edit!


(cl:in-package kxr_controller-msg)


;//! \htmlinclude ServoStateArray.msg.html

(cl:defclass <ServoStateArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (servos
    :reader servos
    :initarg :servos
    :type (cl:vector kxr_controller-msg:ServoState)
   :initform (cl:make-array 0 :element-type 'kxr_controller-msg:ServoState :initial-element (cl:make-instance 'kxr_controller-msg:ServoState))))
)

(cl:defclass ServoStateArray (<ServoStateArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ServoStateArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ServoStateArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kxr_controller-msg:<ServoStateArray> is deprecated: use kxr_controller-msg:ServoStateArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ServoStateArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:header-val is deprecated.  Use kxr_controller-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'servos-val :lambda-list '(m))
(cl:defmethod servos-val ((m <ServoStateArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:servos-val is deprecated.  Use kxr_controller-msg:servos instead.")
  (servos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ServoStateArray>) ostream)
  "Serializes a message object of type '<ServoStateArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'servos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'servos))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ServoStateArray>) istream)
  "Deserializes a message object of type '<ServoStateArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'servos) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'servos)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'kxr_controller-msg:ServoState))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ServoStateArray>)))
  "Returns string type for a message object of type '<ServoStateArray>"
  "kxr_controller/ServoStateArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ServoStateArray)))
  "Returns string type for a message object of type 'ServoStateArray"
  "kxr_controller/ServoStateArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ServoStateArray>)))
  "Returns md5sum for a message object of type '<ServoStateArray>"
  "c49987abc073bf0afcf190de7df7c47c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ServoStateArray)))
  "Returns md5sum for a message object of type 'ServoStateArray"
  "c49987abc073bf0afcf190de7df7c47c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ServoStateArray>)))
  "Returns full string definition for message of type '<ServoStateArray>"
  (cl:format cl:nil "Header header~%ServoState[] servos~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: kxr_controller/ServoState~%std_msgs/Header header~%string name~%float64 position~%float64 error~%float64 temperature~%float64 current~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ServoStateArray)))
  "Returns full string definition for message of type 'ServoStateArray"
  (cl:format cl:nil "Header header~%ServoState[] servos~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: kxr_controller/ServoState~%std_msgs/Header header~%string name~%float64 position~%float64 error~%float64 temperature~%float64 current~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ServoStateArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'servos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ServoStateArray>))
  "Converts a ROS message object to a list"
  (cl:list 'ServoStateArray
    (cl:cons ':header (header msg))
    (cl:cons ':servos (servos msg))
))
