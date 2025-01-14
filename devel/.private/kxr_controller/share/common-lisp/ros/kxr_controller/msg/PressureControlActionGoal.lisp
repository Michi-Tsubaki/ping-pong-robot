; Auto-generated. Do not edit!


(cl:in-package kxr_controller-msg)


;//! \htmlinclude PressureControlActionGoal.msg.html

(cl:defclass <PressureControlActionGoal> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (goal_id
    :reader goal_id
    :initarg :goal_id
    :type actionlib_msgs-msg:GoalID
    :initform (cl:make-instance 'actionlib_msgs-msg:GoalID))
   (goal
    :reader goal
    :initarg :goal
    :type kxr_controller-msg:PressureControlGoal
    :initform (cl:make-instance 'kxr_controller-msg:PressureControlGoal)))
)

(cl:defclass PressureControlActionGoal (<PressureControlActionGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PressureControlActionGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PressureControlActionGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kxr_controller-msg:<PressureControlActionGoal> is deprecated: use kxr_controller-msg:PressureControlActionGoal instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PressureControlActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:header-val is deprecated.  Use kxr_controller-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'goal_id-val :lambda-list '(m))
(cl:defmethod goal_id-val ((m <PressureControlActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:goal_id-val is deprecated.  Use kxr_controller-msg:goal_id instead.")
  (goal_id m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <PressureControlActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:goal-val is deprecated.  Use kxr_controller-msg:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PressureControlActionGoal>) ostream)
  "Serializes a message object of type '<PressureControlActionGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal_id) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PressureControlActionGoal>) istream)
  "Deserializes a message object of type '<PressureControlActionGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal_id) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PressureControlActionGoal>)))
  "Returns string type for a message object of type '<PressureControlActionGoal>"
  "kxr_controller/PressureControlActionGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PressureControlActionGoal)))
  "Returns string type for a message object of type 'PressureControlActionGoal"
  "kxr_controller/PressureControlActionGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PressureControlActionGoal>)))
  "Returns md5sum for a message object of type '<PressureControlActionGoal>"
  "7aec6e2d99481e8fc54c7e0715a478ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PressureControlActionGoal)))
  "Returns md5sum for a message object of type 'PressureControlActionGoal"
  "7aec6e2d99481e8fc54c7e0715a478ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PressureControlActionGoal>)))
  "Returns full string definition for message of type '<PressureControlActionGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%PressureControlGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: kxr_controller/PressureControlGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%uint16 board_idx # ICS controller ID (2n or 2n+1)~%~%# Pressure control parameters~%# If trigger_pressure < target_pressure: pressurization mode~%# If trigger_pressure > target_pressure: depressurization mode~%float32 trigger_pressure # Pressure threshold to start valve operation [kPa]~%float32 target_pressure # Desired pressure level for optimal operation [kPa]~%~%# Air release parameters~%# If the value is zero, pressure control is performed based on trigger_pressure and target_pressure~%# If the value is greater than zero, solenoid valves opens for release_duration[s] and the work conducts to the atmosphere~%float32 release_duration # Duration for atmospheric venting [s]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PressureControlActionGoal)))
  "Returns full string definition for message of type 'PressureControlActionGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%PressureControlGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: kxr_controller/PressureControlGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%uint16 board_idx # ICS controller ID (2n or 2n+1)~%~%# Pressure control parameters~%# If trigger_pressure < target_pressure: pressurization mode~%# If trigger_pressure > target_pressure: depressurization mode~%float32 trigger_pressure # Pressure threshold to start valve operation [kPa]~%float32 target_pressure # Desired pressure level for optimal operation [kPa]~%~%# Air release parameters~%# If the value is zero, pressure control is performed based on trigger_pressure and target_pressure~%# If the value is greater than zero, solenoid valves opens for release_duration[s] and the work conducts to the atmosphere~%float32 release_duration # Duration for atmospheric venting [s]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PressureControlActionGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PressureControlActionGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'PressureControlActionGoal
    (cl:cons ':header (header msg))
    (cl:cons ':goal_id (goal_id msg))
    (cl:cons ':goal (goal msg))
))
