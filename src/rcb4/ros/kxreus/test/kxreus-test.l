(require :unittest "lib/llib/unittest.l")
(init-unit-test)

(ros::roseus "test_kxreus")

(load "package://kxreus/euslisp/kxr-interface.l")

(setq namespace (ros::get-param "~namespace" nil))
(ros::ros-warn (format nil "namespace ~A" namespace))
(kxr-init :namespace namespace
          :create-viewer nil)

(defun kxr-test-angle-vector ()
  (send *ri* :servo-on)
  (send *ri* :angle-vector (send *robot* :init-pose) 1.0)
  (send *ri* :wait-interpolation)
  (send *robot* :HEAD_JOINT0 :joint-angle 45)
  (send *robot* :HEAD_JOINT1 :joint-angle 45)
  (send *ri* :angle-vector (send *robot* :angle-vector) 1.0)
  (send *ri* :wait-interpolation)
  (send *ri* :angle-vector (send *robot* :init-pose) 1.0)
  (send *ri* :wait-interpolation)
  (send *ri* :servo-off))

(deftest kxr-test-angle-vector1 () (kxr-test-angle-vector))
(run-all-tests)
(exit)
