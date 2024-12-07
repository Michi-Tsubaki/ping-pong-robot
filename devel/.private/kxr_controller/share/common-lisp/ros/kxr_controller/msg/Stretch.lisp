; Auto-generated. Do not edit!


(cl:in-package kxr_controller-msg)


;//! \htmlinclude Stretch.msg.html

(cl:defclass <Stretch> (roslisp-msg-protocol:ros-message)
  ((joint_names
    :reader joint_names
    :initarg :joint_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (stretch
    :reader stretch
    :initarg :stretch
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass Stretch (<Stretch>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Stretch>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Stretch)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kxr_controller-msg:<Stretch> is deprecated: use kxr_controller-msg:Stretch instead.")))

(cl:ensure-generic-function 'joint_names-val :lambda-list '(m))
(cl:defmethod joint_names-val ((m <Stretch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:joint_names-val is deprecated.  Use kxr_controller-msg:joint_names instead.")
  (joint_names m))

(cl:ensure-generic-function 'stretch-val :lambda-list '(m))
(cl:defmethod stretch-val ((m <Stretch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kxr_controller-msg:stretch-val is deprecated.  Use kxr_controller-msg:stretch instead.")
  (stretch m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Stretch>) ostream)
  "Serializes a message object of type '<Stretch>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'stretch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'stretch))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Stretch>) istream)
  "Deserializes a message object of type '<Stretch>"
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
  (cl:setf (cl:slot-value msg 'stretch) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'stretch)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Stretch>)))
  "Returns string type for a message object of type '<Stretch>"
  "kxr_controller/Stretch")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Stretch)))
  "Returns string type for a message object of type 'Stretch"
  "kxr_controller/Stretch")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Stretch>)))
  "Returns md5sum for a message object of type '<Stretch>"
  "9b2b730aeb11dca161b5a118a2171acb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Stretch)))
  "Returns md5sum for a message object of type 'Stretch"
  "9b2b730aeb11dca161b5a118a2171acb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Stretch>)))
  "Returns full string definition for message of type '<Stretch>"
  (cl:format cl:nil "string[] joint_names~%int32[] stretch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Stretch)))
  "Returns full string definition for message of type 'Stretch"
  (cl:format cl:nil "string[] joint_names~%int32[] stretch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Stretch>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'stretch) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Stretch>))
  "Converts a ROS message object to a list"
  (cl:list 'Stretch
    (cl:cons ':joint_names (joint_names msg))
    (cl:cons ':stretch (stretch msg))
))
