;; Auto-generated. Do not edit!


(when (boundp 'kxr_controller::PressureControl)
  (if (not (find-package "KXR_CONTROLLER"))
    (make-package "KXR_CONTROLLER"))
  (shadow 'PressureControl (find-package "KXR_CONTROLLER")))
(unless (find-package "KXR_CONTROLLER::PRESSURECONTROL")
  (make-package "KXR_CONTROLLER::PRESSURECONTROL"))

(in-package "ROS")
;;//! \htmlinclude PressureControl.msg.html


(defclass kxr_controller::PressureControl
  :super ros::object
  :slots (_board_idx _start_pressure _stop_pressure _release ))

(defmethod kxr_controller::PressureControl
  (:init
   (&key
    ((:board_idx __board_idx) 0)
    ((:start_pressure __start_pressure) 0.0)
    ((:stop_pressure __stop_pressure) 0.0)
    ((:release __release) nil)
    )
   (send-super :init)
   (setq _board_idx (round __board_idx))
   (setq _start_pressure (float __start_pressure))
   (setq _stop_pressure (float __stop_pressure))
   (setq _release __release)
   self)
  (:board_idx
   (&optional __board_idx)
   (if __board_idx (setq _board_idx __board_idx)) _board_idx)
  (:start_pressure
   (&optional __start_pressure)
   (if __start_pressure (setq _start_pressure __start_pressure)) _start_pressure)
  (:stop_pressure
   (&optional __stop_pressure)
   (if __stop_pressure (setq _stop_pressure __stop_pressure)) _stop_pressure)
  (:release
   (&optional (__release :null))
   (if (not (eq __release :null)) (setq _release __release)) _release)
  (:serialization-length
   ()
   (+
    ;; uint16 _board_idx
    2
    ;; float32 _start_pressure
    4
    ;; float32 _stop_pressure
    4
    ;; bool _release
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _board_idx
       (write-word _board_idx s)
     ;; float32 _start_pressure
       (sys::poke _start_pressure (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _stop_pressure
       (sys::poke _stop_pressure (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _release
       (if _release (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _board_idx
     (setq _board_idx (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _start_pressure
     (setq _start_pressure (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _stop_pressure
     (setq _stop_pressure (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _release
     (setq _release (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get kxr_controller::PressureControl :md5sum-) "61bcf3809e7f0e409628cc484675109d")
(setf (get kxr_controller::PressureControl :datatype-) "kxr_controller/PressureControl")
(setf (get kxr_controller::PressureControl :definition-)
      "uint16 board_idx  # Do not use board id? (Currently, bus-connected air board is not supported)
float32 start_pressure  # Threshold [kPa] to start pump (Currently, pressurization is not supported)
float32 stop_pressure  # Threshold [kPa] to stop pump (Currently, pressurization is not supported)
bool release  # Set true to release air by opening valve.

")



(provide :kxr_controller/PressureControl "61bcf3809e7f0e409628cc484675109d")


