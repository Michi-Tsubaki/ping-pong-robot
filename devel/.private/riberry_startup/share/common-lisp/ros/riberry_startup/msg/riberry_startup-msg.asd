
(cl:in-package :asdf)

(defsystem "riberry_startup-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ImuFace" :depends-on ("_package_ImuFace"))
    (:file "_package_ImuFace" :depends-on ("_package"))
  ))