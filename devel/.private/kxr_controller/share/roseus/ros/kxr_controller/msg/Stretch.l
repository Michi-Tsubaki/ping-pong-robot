;; Auto-generated. Do not edit!


(when (boundp 'kxr_controller::Stretch)
  (if (not (find-package "KXR_CONTROLLER"))
    (make-package "KXR_CONTROLLER"))
  (shadow 'Stretch (find-package "KXR_CONTROLLER")))
(unless (find-package "KXR_CONTROLLER::STRETCH")
  (make-package "KXR_CONTROLLER::STRETCH"))

(in-package "ROS")
;;//! \htmlinclude Stretch.msg.html


(defclass kxr_controller::Stretch
  :super ros::object
  :slots (_joint_names _stretch ))

(defmethod kxr_controller::Stretch
  (:init
   (&key
    ((:joint_names __joint_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:stretch __stretch) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _joint_names __joint_names)
   (setq _stretch __stretch)
   self)
  (:joint_names
   (&optional __joint_names)
   (if __joint_names (setq _joint_names __joint_names)) _joint_names)
  (:stretch
   (&optional __stretch)
   (if __stretch (setq _stretch __stretch)) _stretch)
  (:serialization-length
   ()
   (+
    ;; string[] _joint_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _joint_names)) 4
    ;; int32[] _stretch
    (* 4    (length _stretch)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _joint_names
     (write-long (length _joint_names) s)
     (dolist (elem _joint_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; int32[] _stretch
     (write-long (length _stretch) s)
     (dotimes (i (length _stretch))
       (write-long (elt _stretch i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _joint_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _joint_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; int32[] _stretch
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _stretch (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _stretch i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get kxr_controller::Stretch :md5sum-) "9b2b730aeb11dca161b5a118a2171acb")
(setf (get kxr_controller::Stretch :datatype-) "kxr_controller/Stretch")
(setf (get kxr_controller::Stretch :definition-)
      "string[] joint_names
int32[] stretch

")



(provide :kxr_controller/Stretch "9b2b730aeb11dca161b5a118a2171acb")


