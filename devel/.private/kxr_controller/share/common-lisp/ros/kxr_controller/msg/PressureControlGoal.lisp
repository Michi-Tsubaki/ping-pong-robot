; Auto-generated. Do not edit!


(cl:in-package kxr_controller-msg)


;//! \htmlinclude PressureControlGoal.msg.html

(cl:defclass <PressureControlGoal> (roslisp-msg-protocol:ros-message)
  ((board_idx
    :reader board_idx
    :initarg :board_idx
    :type cl:fixnum
    :initform 0)
   (start_pressure
    :reader start_pressure
    :initarg :start_pressure
    :type cl:float
    :initform 0.0)
   (stop_pressure
    :reader stop_pressure
    :initarg :stop_pressure
    :type cl:float
    :initform 0.0)
   (release
    :reader release
    :initarg :release
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PressureControlGoal (<PressureControlGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PressureControlGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PressureControlGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kxr_controller-msg:<PressureControlGoal> is deprecated: use kxr_controller-msg:PressureControlGoal instead.")))

(cl:ensure-generic-function 'board_idx-val :lambda-list '(m))
(cl:defmethod board_idx-val ((m <PressureControlGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:board_idx-val is deprecated.  Use kxr_controller-msg:board_idx instead.")
  (board_idx m))

(cl:ensure-generic-function 'start_pressure-val :lambda-list '(m))
(cl:defmethod start_pressure-val ((m <PressureControlGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:start_pressure-val is deprecated.  Use kxr_controller-msg:start_pressure instead.")
  (start_pressure m))

(cl:ensure-generic-function 'stop_pressure-val :lambda-list '(m))
(cl:defmethod stop_pressure-val ((m <PressureControlGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:stop_pressure-val is deprecated.  Use kxr_controller-msg:stop_pressure instead.")
  (stop_pressure m))

(cl:ensure-generic-function 'release-val :lambda-list '(m))
(cl:defmethod release-val ((m <PressureControlGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:release-val is deprecated.  Use kxr_controller-msg:release instead.")
  (release m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PressureControlGoal>) ostream)
  "Serializes a message object of type '<PressureControlGoal>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'board_idx)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'board_idx)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'start_pressure))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'stop_pressure))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'release) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PressureControlGoal>) istream)
  "Deserializes a message object of type '<PressureControlGoal>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'board_idx)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'board_idx)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'start_pressure) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'stop_pressure) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'release) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PressureControlGoal>)))
  "Returns string type for a message object of type '<PressureControlGoal>"
  "kxr_controller/PressureControlGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PressureControlGoal)))
  "Returns string type for a message object of type 'PressureControlGoal"
  "kxr_controller/PressureControlGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PressureControlGoal>)))
  "Returns md5sum for a message object of type '<PressureControlGoal>"
  "61bcf3809e7f0e409628cc484675109d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PressureControlGoal)))
  "Returns md5sum for a message object of type 'PressureControlGoal"
  "61bcf3809e7f0e409628cc484675109d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PressureControlGoal>)))
  "Returns full string definition for message of type '<PressureControlGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%uint16 board_idx  # Do not use board id? (Currently, bus-connected air board is not supported)~%float32 start_pressure  # Threshold [kPa] to start pump (Currently, pressurization is not supported)~%float32 stop_pressure  # Threshold [kPa] to stop pump (Currently, pressurization is not supported)~%bool release  # Set true to release air by opening valve.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PressureControlGoal)))
  "Returns full string definition for message of type 'PressureControlGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%uint16 board_idx  # Do not use board id? (Currently, bus-connected air board is not supported)~%float32 start_pressure  # Threshold [kPa] to start pump (Currently, pressurization is not supported)~%float32 stop_pressure  # Threshold [kPa] to stop pump (Currently, pressurization is not supported)~%bool release  # Set true to release air by opening valve.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PressureControlGoal>))
  (cl:+ 0
     2
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PressureControlGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'PressureControlGoal
    (cl:cons ':board_idx (board_idx msg))
    (cl:cons ':start_pressure (start_pressure msg))
    (cl:cons ':stop_pressure (stop_pressure msg))
    (cl:cons ':release (release msg))
))
