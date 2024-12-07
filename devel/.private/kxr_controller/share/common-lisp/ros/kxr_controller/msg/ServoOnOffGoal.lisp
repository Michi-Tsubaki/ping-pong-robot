; Auto-generated. Do not edit!


(cl:in-package kxr_controller-msg)


;//! \htmlinclude ServoOnOffGoal.msg.html

(cl:defclass <ServoOnOffGoal> (roslisp-msg-protocol:ros-message)
  ((joint_names
    :reader joint_names
    :initarg :joint_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (servo_on_states
    :reader servo_on_states
    :initarg :servo_on_states
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass ServoOnOffGoal (<ServoOnOffGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ServoOnOffGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ServoOnOffGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kxr_controller-msg:<ServoOnOffGoal> is deprecated: use kxr_controller-msg:ServoOnOffGoal instead.")))

(cl:ensure-generic-function 'joint_names-val :lambda-list '(m))
(cl:defmethod joint_names-val ((m <ServoOnOffGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:joint_names-val is deprecated.  Use kxr_controller-msg:joint_names instead.")
  (joint_names m))

(cl:ensure-generic-function 'servo_on_states-val :lambda-list '(m))
(cl:defmethod servo_on_states-val ((m <ServoOnOffGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:servo_on_states-val is deprecated.  Use kxr_controller-msg:servo_on_states instead.")
  (servo_on_states m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ServoOnOffGoal>) ostream)
  "Serializes a message object of type '<ServoOnOffGoal>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'joint_names))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'servo_on_states))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'servo_on_states))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ServoOnOffGoal>) istream)
  "Deserializes a message object of type '<ServoOnOffGoal>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'servo_on_states) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'servo_on_states)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ServoOnOffGoal>)))
  "Returns string type for a message object of type '<ServoOnOffGoal>"
  "kxr_controller/ServoOnOffGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ServoOnOffGoal)))
  "Returns string type for a message object of type 'ServoOnOffGoal"
  "kxr_controller/ServoOnOffGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ServoOnOffGoal>)))
  "Returns md5sum for a message object of type '<ServoOnOffGoal>"
  "29bb8c289c7a237569042d21176cbdd5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ServoOnOffGoal)))
  "Returns md5sum for a message object of type 'ServoOnOffGoal"
  "29bb8c289c7a237569042d21176cbdd5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ServoOnOffGoal>)))
  "Returns full string definition for message of type '<ServoOnOffGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string[] joint_names~%bool[] servo_on_states~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ServoOnOffGoal)))
  "Returns full string definition for message of type 'ServoOnOffGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string[] joint_names~%bool[] servo_on_states~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ServoOnOffGoal>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'servo_on_states) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ServoOnOffGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'ServoOnOffGoal
    (cl:cons ':joint_names (joint_names msg))
    (cl:cons ':servo_on_states (servo_on_states msg))
))
