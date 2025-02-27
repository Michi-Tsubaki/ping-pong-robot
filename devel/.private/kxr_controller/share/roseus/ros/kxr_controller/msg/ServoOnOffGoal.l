;; Auto-generated. Do not edit!


(when (boundp 'kxr_controller::ServoOnOffGoal)
  (if (not (find-package "KXR_CONTROLLER"))
    (make-package "KXR_CONTROLLER"))
  (shadow 'ServoOnOffGoal (find-package "KXR_CONTROLLER")))
(unless (find-package "KXR_CONTROLLER::SERVOONOFFGOAL")
  (make-package "KXR_CONTROLLER::SERVOONOFFGOAL"))

(in-package "ROS")
;;//! \htmlinclude ServoOnOffGoal.msg.html


(defclass kxr_controller::ServoOnOffGoal
  :super ros::object
  :slots (_joint_names _servo_on_states ))

(defmethod kxr_controller::ServoOnOffGoal
  (:init
   (&key
    ((:joint_names __joint_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:servo_on_states __servo_on_states) (let (r) (dotimes (i 0) (push nil r)) r))
    )
   (send-super :init)
   (setq _joint_names __joint_names)
   (setq _servo_on_states __servo_on_states)
   self)
  (:joint_names
   (&optional __joint_names)
   (if __joint_names (setq _joint_names __joint_names)) _joint_names)
  (:servo_on_states
   (&optional __servo_on_states)
   (if __servo_on_states (setq _servo_on_states __servo_on_states)) _servo_on_states)
  (:serialization-length
   ()
   (+
    ;; string[] _joint_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _joint_names)) 4
    ;; bool[] _servo_on_states
    (* 1    (length _servo_on_states)) 4
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
     ;; bool[] _servo_on_states
     (write-long (length _servo_on_states) s)
     (dotimes (i (length _servo_on_states))
       (if (elt _servo_on_states i) (write-byte -1 s) (write-byte 0 s))
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
   ;; bool[] _servo_on_states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _servo_on_states (make-list n))
     (dotimes (i n)
     (setf (elt _servo_on_states i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;;
   self)
  )

(setf (get kxr_controller::ServoOnOffGoal :md5sum-) "29bb8c289c7a237569042d21176cbdd5")
(setf (get kxr_controller::ServoOnOffGoal :datatype-) "kxr_controller/ServoOnOffGoal")
(setf (get kxr_controller::ServoOnOffGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
string[] joint_names
bool[] servo_on_states

")



(provide :kxr_controller/ServoOnOffGoal "29bb8c289c7a237569042d21176cbdd5")


