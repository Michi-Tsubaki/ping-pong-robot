;; Auto-generated. Do not edit!


(when (boundp 'riberry_startup::ImuFace)
  (if (not (find-package "RIBERRY_STARTUP"))
    (make-package "RIBERRY_STARTUP"))
  (shadow 'ImuFace (find-package "RIBERRY_STARTUP")))
(unless (find-package "RIBERRY_STARTUP::IMUFACE")
  (make-package "RIBERRY_STARTUP::IMUFACE"))

(in-package "ROS")
;;//! \htmlinclude ImuFace.msg.html


(intern "*NONE*" (find-package "RIBERRY_STARTUP::IMUFACE"))
(shadow '*NONE* (find-package "RIBERRY_STARTUP::IMUFACE"))
(defconstant riberry_startup::ImuFace::*NONE* 0)
(intern "*TOP*" (find-package "RIBERRY_STARTUP::IMUFACE"))
(shadow '*TOP* (find-package "RIBERRY_STARTUP::IMUFACE"))
(defconstant riberry_startup::ImuFace::*TOP* 1)
(intern "*BOTTOM*" (find-package "RIBERRY_STARTUP::IMUFACE"))
(shadow '*BOTTOM* (find-package "RIBERRY_STARTUP::IMUFACE"))
(defconstant riberry_startup::ImuFace::*BOTTOM* 2)
(intern "*FRONT*" (find-package "RIBERRY_STARTUP::IMUFACE"))
(shadow '*FRONT* (find-package "RIBERRY_STARTUP::IMUFACE"))
(defconstant riberry_startup::ImuFace::*FRONT* 3)
(intern "*BACK*" (find-package "RIBERRY_STARTUP::IMUFACE"))
(shadow '*BACK* (find-package "RIBERRY_STARTUP::IMUFACE"))
(defconstant riberry_startup::ImuFace::*BACK* 4)
(intern "*LEFT*" (find-package "RIBERRY_STARTUP::IMUFACE"))
(shadow '*LEFT* (find-package "RIBERRY_STARTUP::IMUFACE"))
(defconstant riberry_startup::ImuFace::*LEFT* 5)
(intern "*RIGHT*" (find-package "RIBERRY_STARTUP::IMUFACE"))
(shadow '*RIGHT* (find-package "RIBERRY_STARTUP::IMUFACE"))
(defconstant riberry_startup::ImuFace::*RIGHT* 6)

(defun riberry_startup::ImuFace-to-symbol (const)
  (cond
        ((= const 0) 'riberry_startup::ImuFace::*NONE*)
        ((= const 1) 'riberry_startup::ImuFace::*TOP*)
        ((= const 2) 'riberry_startup::ImuFace::*BOTTOM*)
        ((= const 3) 'riberry_startup::ImuFace::*FRONT*)
        ((= const 4) 'riberry_startup::ImuFace::*BACK*)
        ((= const 5) 'riberry_startup::ImuFace::*LEFT*)
        ((= const 6) 'riberry_startup::ImuFace::*RIGHT*)
        (t nil)))

(defclass riberry_startup::ImuFace
  :super ros::object
  :slots (_face ))

(defmethod riberry_startup::ImuFace
  (:init
   (&key
    ((:face __face) 0)
    )
   (send-super :init)
   (setq _face (round __face))
   self)
  (:face
   (&optional __face)
   (if __face (setq _face __face)) _face)
  (:serialization-length
   ()
   (+
    ;; uint8 _face
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _face
       (write-byte _face s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _face
     (setq _face (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get riberry_startup::ImuFace :md5sum-) "bc43845fd7aaeadf93808c9e9901eb62")
(setf (get riberry_startup::ImuFace :datatype-) "riberry_startup/ImuFace")
(setf (get riberry_startup::ImuFace :definition-)
      "uint8 NONE=0
uint8 TOP=1
uint8 BOTTOM=2
uint8 FRONT=3
uint8 BACK=4
uint8 LEFT=5
uint8 RIGHT=6

uint8 face

")



(provide :riberry_startup/ImuFace "bc43845fd7aaeadf93808c9e9901eb62")


