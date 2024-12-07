; Auto-generated. Do not edit!


(cl:in-package kxr_controller-msg)


;//! \htmlinclude AdjustAngleVectorGoal.msg.html

(cl:defclass <AdjustAngleVectorGoal> (roslisp-msg-protocol:ros-message)
  ((joint_names
    :reader joint_names
    :initarg :joint_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (error_threshold
    :reader error_threshold
    :initarg :error_threshold
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass AdjustAngleVectorGoal (<AdjustAngleVectorGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AdjustAngleVectorGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AdjustAngleVectorGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kxr_controller-msg:<AdjustAngleVectorGoal> is deprecated: use kxr_controller-msg:AdjustAngleVectorGoal instead.")))

(cl:ensure-generic-function 'joint_names-val :lambda-list '(m))
(cl:defmethod joint_names-val ((m <AdjustAngleVectorGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:joint_names-val is deprecated.  Use kxr_controller-msg:joint_names instead.")
  (joint_names m))

(cl:ensure-generic-function 'error_threshold-val :lambda-list '(m))
(cl:defmethod error_threshold-val ((m <AdjustAngleVectorGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:error_threshold-val is deprecated.  Use kxr_controller-msg:error_threshold instead.")
  (error_threshold m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AdjustAngleVectorGoal>) ostream)
  "Serializes a message object of type '<AdjustAngleVectorGoal>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'error_threshold))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'error_threshold))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AdjustAngleVectorGoal>) istream)
  "Deserializes a message object of type '<AdjustAngleVectorGoal>"
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
  (cl:setf (cl:slot-value msg 'error_threshold) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'error_threshold)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AdjustAngleVectorGoal>)))
  "Returns string type for a message object of type '<AdjustAngleVectorGoal>"
  "kxr_controller/AdjustAngleVectorGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AdjustAngleVectorGoal)))
  "Returns string type for a message object of type 'AdjustAngleVectorGoal"
  "kxr_controller/AdjustAngleVectorGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AdjustAngleVectorGoal>)))
  "Returns md5sum for a message object of type '<AdjustAngleVectorGoal>"
  "cf618411b2b5e77c4c269ff22a27ed58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AdjustAngleVectorGoal)))
  "Returns md5sum for a message object of type 'AdjustAngleVectorGoal"
  "cf618411b2b5e77c4c269ff22a27ed58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AdjustAngleVectorGoal>)))
  "Returns full string definition for message of type '<AdjustAngleVectorGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string[] joint_names~%float32[] error_threshold~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AdjustAngleVectorGoal)))
  "Returns full string definition for message of type 'AdjustAngleVectorGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string[] joint_names~%float32[] error_threshold~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AdjustAngleVectorGoal>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'error_threshold) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AdjustAngleVectorGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'AdjustAngleVectorGoal
    (cl:cons ':joint_names (joint_names msg))
    (cl:cons ':error_threshold (error_threshold msg))
))
