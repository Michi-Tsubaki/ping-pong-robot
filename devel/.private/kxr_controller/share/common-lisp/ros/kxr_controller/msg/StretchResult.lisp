; Auto-generated. Do not edit!


(cl:in-package kxr_controller-msg)


;//! \htmlinclude StretchResult.msg.html

(cl:defclass <StretchResult> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass StretchResult (<StretchResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StretchResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StretchResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kxr_controller-msg:<StretchResult> is deprecated: use kxr_controller-msg:StretchResult instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StretchResult>) ostream)
  "Serializes a message object of type '<StretchResult>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StretchResult>) istream)
  "Deserializes a message object of type '<StretchResult>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StretchResult>)))
  "Returns string type for a message object of type '<StretchResult>"
  "kxr_controller/StretchResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StretchResult)))
  "Returns string type for a message object of type 'StretchResult"
  "kxr_controller/StretchResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StretchResult>)))
  "Returns md5sum for a message object of type '<StretchResult>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StretchResult)))
  "Returns md5sum for a message object of type 'StretchResult"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StretchResult>)))
  "Returns full string definition for message of type '<StretchResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StretchResult)))
  "Returns full string definition for message of type 'StretchResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StretchResult>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StretchResult>))
  "Converts a ROS message object to a list"
  (cl:list 'StretchResult
))
