; Auto-generated. Do not edit!


(cl:in-package kxr_controller-msg)


;//! \htmlinclude PressureControl.msg.html

(cl:defclass <PressureControl> (roslisp-msg-protocol:ros-message)
  ((board_idx
    :reader board_idx
    :initarg :board_idx
    :type cl:fixnum
    :initform 0)
   (trigger_pressure
    :reader trigger_pressure
    :initarg :trigger_pressure
    :type cl:float
    :initform 0.0)
   (target_pressure
    :reader target_pressure
    :initarg :target_pressure
    :type cl:float
    :initform 0.0)
   (release_duration
    :reader release_duration
    :initarg :release_duration
    :type cl:float
    :initform 0.0))
)

(cl:defclass PressureControl (<PressureControl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PressureControl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PressureControl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kxr_controller-msg:<PressureControl> is deprecated: use kxr_controller-msg:PressureControl instead.")))

(cl:ensure-generic-function 'board_idx-val :lambda-list '(m))
(cl:defmethod board_idx-val ((m <PressureControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:board_idx-val is deprecated.  Use kxr_controller-msg:board_idx instead.")
  (board_idx m))

(cl:ensure-generic-function 'trigger_pressure-val :lambda-list '(m))
(cl:defmethod trigger_pressure-val ((m <PressureControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:trigger_pressure-val is deprecated.  Use kxr_controller-msg:trigger_pressure instead.")
  (trigger_pressure m))

(cl:ensure-generic-function 'target_pressure-val :lambda-list '(m))
(cl:defmethod target_pressure-val ((m <PressureControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:target_pressure-val is deprecated.  Use kxr_controller-msg:target_pressure instead.")
  (target_pressure m))

(cl:ensure-generic-function 'release_duration-val :lambda-list '(m))
(cl:defmethod release_duration-val ((m <PressureControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:release_duration-val is deprecated.  Use kxr_controller-msg:release_duration instead.")
  (release_duration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PressureControl>) ostream)
  "Serializes a message object of type '<PressureControl>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'board_idx)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'board_idx)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'trigger_pressure))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target_pressure))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'release_duration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PressureControl>) istream)
  "Deserializes a message object of type '<PressureControl>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'board_idx)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'board_idx)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'trigger_pressure) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_pressure) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'release_duration) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PressureControl>)))
  "Returns string type for a message object of type '<PressureControl>"
  "kxr_controller/PressureControl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PressureControl)))
  "Returns string type for a message object of type 'PressureControl"
  "kxr_controller/PressureControl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PressureControl>)))
  "Returns md5sum for a message object of type '<PressureControl>"
  "a86a02fea7b03d3f9f0d8e33715d5ad0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PressureControl)))
  "Returns md5sum for a message object of type 'PressureControl"
  "a86a02fea7b03d3f9f0d8e33715d5ad0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PressureControl>)))
  "Returns full string definition for message of type '<PressureControl>"
  (cl:format cl:nil "uint16 board_idx # ICS controller ID (2n or 2n+1)~%~%# Pressure control parameters~%# If trigger_pressure < target_pressure: pressurization mode~%# If trigger_pressure > target_pressure: depressurization mode~%float32 trigger_pressure # Pressure threshold to start valve operation [kPa]~%float32 target_pressure # Desired pressure level for optimal operation [kPa]~%~%# Air release parameters~%# If the value is zero, pressure control is performed based on trigger_pressure and target_pressure~%# If the value is greater than zero, solenoid valves opens for release_duration[s] and the work conducts to the atmosphere~%float32 release_duration # Duration for atmospheric venting [s]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PressureControl)))
  "Returns full string definition for message of type 'PressureControl"
  (cl:format cl:nil "uint16 board_idx # ICS controller ID (2n or 2n+1)~%~%# Pressure control parameters~%# If trigger_pressure < target_pressure: pressurization mode~%# If trigger_pressure > target_pressure: depressurization mode~%float32 trigger_pressure # Pressure threshold to start valve operation [kPa]~%float32 target_pressure # Desired pressure level for optimal operation [kPa]~%~%# Air release parameters~%# If the value is zero, pressure control is performed based on trigger_pressure and target_pressure~%# If the value is greater than zero, solenoid valves opens for release_duration[s] and the work conducts to the atmosphere~%float32 release_duration # Duration for atmospheric venting [s]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PressureControl>))
  (cl:+ 0
     2
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PressureControl>))
  "Converts a ROS message object to a list"
  (cl:list 'PressureControl
    (cl:cons ':board_idx (board_idx msg))
    (cl:cons ':trigger_pressure (trigger_pressure msg))
    (cl:cons ':target_pressure (target_pressure msg))
    (cl:cons ':release_duration (release_duration msg))
))
