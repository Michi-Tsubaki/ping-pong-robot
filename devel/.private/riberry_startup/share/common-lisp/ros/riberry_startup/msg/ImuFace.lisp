; Auto-generated. Do not edit!


(cl:in-package riberry_startup-msg)


;//! \htmlinclude ImuFace.msg.html

(cl:defclass <ImuFace> (roslisp-msg-protocol:ros-message)
  ((face
    :reader face
    :initarg :face
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ImuFace (<ImuFace>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImuFace>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImuFace)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name riberry_startup-msg:<ImuFace> is deprecated: use riberry_startup-msg:ImuFace instead.")))

(cl:ensure-generic-function 'face-val :lambda-list '(m))
(cl:defmethod face-val ((m <ImuFace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader riberry_startup-msg:face-val is deprecated.  Use riberry_startup-msg:face instead.")
  (face m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ImuFace>)))
    "Constants for message type '<ImuFace>"
  '((:NONE . 0)
    (:TOP . 1)
    (:BOTTOM . 2)
    (:FRONT . 3)
    (:BACK . 4)
    (:LEFT . 5)
    (:RIGHT . 6))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ImuFace)))
    "Constants for message type 'ImuFace"
  '((:NONE . 0)
    (:TOP . 1)
    (:BOTTOM . 2)
    (:FRONT . 3)
    (:BACK . 4)
    (:LEFT . 5)
    (:RIGHT . 6))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImuFace>) ostream)
  "Serializes a message object of type '<ImuFace>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'face)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImuFace>) istream)
  "Deserializes a message object of type '<ImuFace>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'face)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImuFace>)))
  "Returns string type for a message object of type '<ImuFace>"
  "riberry_startup/ImuFace")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImuFace)))
  "Returns string type for a message object of type 'ImuFace"
  "riberry_startup/ImuFace")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImuFace>)))
  "Returns md5sum for a message object of type '<ImuFace>"
  "bc43845fd7aaeadf93808c9e9901eb62")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImuFace)))
  "Returns md5sum for a message object of type 'ImuFace"
  "bc43845fd7aaeadf93808c9e9901eb62")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImuFace>)))
  "Returns full string definition for message of type '<ImuFace>"
  (cl:format cl:nil "uint8 NONE=0~%uint8 TOP=1~%uint8 BOTTOM=2~%uint8 FRONT=3~%uint8 BACK=4~%uint8 LEFT=5~%uint8 RIGHT=6~%~%uint8 face~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImuFace)))
  "Returns full string definition for message of type 'ImuFace"
  (cl:format cl:nil "uint8 NONE=0~%uint8 TOP=1~%uint8 BOTTOM=2~%uint8 FRONT=3~%uint8 BACK=4~%uint8 LEFT=5~%uint8 RIGHT=6~%~%uint8 face~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImuFace>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImuFace>))
  "Converts a ROS message object to a list"
  (cl:list 'ImuFace
    (cl:cons ':face (face msg))
))
