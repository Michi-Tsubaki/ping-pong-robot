(load "HARIMOTO-interface.l")
(hari-init)
(send *ri* :servo-on)
(send *ri* :angle-vector (send *hari* :angle-vector) 2000)
(defun wait-pose()
  (send *ri* :angle-vector #f(-70 28 -44 70) 5000)
  )
(defun stop()
  (send *ri* :servo-off)
  )
(defun keep()
  (send *ri* :angle-vector (send *ri* :state :angle-vector) 100)
  (send *ri* :servo-on)
  )

(setq *path* (list))
(setq *time* (list))
(stop)
(do-until-key
 (push (send *ri* :state :angle-vector) *path*)
 (push 30 *time*)
 (unix:usleep 50000)
 )

(nreverse *path*)

(send *ri* :servo-on)

  (send *ri* :angle-vector-sequence *path* *time*
       :default-controller 0.001
       :min-time 0.0001
       :minjerk-interpolation t
       )
 (send *ri* :wait-interpolation)
 (send *irtviewer* :draw-objects)
(send *ri* :servo-off)
