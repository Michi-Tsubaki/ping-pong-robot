#!/usr/bin/env roseus

(load "jedy-interface.l")

(jedy-init)
(send *ri* :servo-on)
(send *jedy* :reset-pose)
(send *ri* :angle-vector (send *jedy* :angle-vector) 2000) ;;go to reset position
(unix:sleep 2) ;ラケットを持たせる

(do-until-key
 (setq r1 #f(-71.955 -72.09 -62.3025 27.3713 134.645 -68.6475 -2.76751 30 9.51751 8.84251 134.629 -6.07501 134.629 50.4225 89.9544 -24.5025 11.07 18.225))
 (setq r2 #f(-71.6512 -57.8475 -62.9775 27.7088 134.645 -46.2375 -3.10501 30 9.51751 8.84251 134.629 -6.07501 134.629 50.4225 89.9544 -24.5025 11.07 18.225))
 (setq r3 #f(-69.12 -48.5325 -62.9775 27.7088 134.645 -30.3075 -8.67376 30 9.51751 8.84251 134.629 -6.07501 134.629 50.4225 89.9544 -24.5025 11.07 18.225))
 (setq r4 #f(-69.7612 -32.2312 -62.9775 27.3713 134.645 -9.41624 -8.67376 30 9.51751 8.84251 134.645 -6.07501 134.629 50.4225 89.9544 -24.5025 11.07 18.225))
 (setq r5 #f(-69.7612 -28.5862 -62.9775 27.3713 134.645 -2.12624 -8.67376 30 9.51751 8.84251 134.645 -6.07501 134.629 50.4225 89.9544 -24.5025 11.07 18.225))

 (setq tm 50)
 (send *ri* :angle-vector-sequence (list r1 r2 r3 r4 r5 r1) (list tm tm tm tm tm 1000)
       :default-controller 0.001
       :min-time 0.0001
       :minjerk-interpolation t
       )
 (send *ri* :wait-interpolation)
 (send *irtviewer* :draw-objects)
 )


#| angle vector raw data

#f(-71.955 -72.09 -62.3025 27.3713 134.645 -68.6475 -2.76751 16.7062 9.51751 8.84251 134.629 -6.07501 134.629 50.4225 89.9544 -24.5025 11.07 18.225)
194.irteusgl$ (send *ri* :state :potentio-vector)
;; #<rotational-joint #X562ba03f0818 larm_joint6> :joint-angle(93.3525) violate max-angle(89.9544)
;; #<rotational-joint #X562ba08da838 rarm_joint4> :joint-angle(151.875) violate max-angle(134.645)
#f(-71.6512 -57.8475 -62.9775 27.7088 134.645 -46.2375 -3.10501 16.7062 9.51751 8.84251 134.629 -6.07501 134.629 50.4225 89.9544 -24.5025 11.07 18.225)
195.irteusgl$ (send *ri* :state :potentio-vector)
;; #<rotational-joint #X562ba03f0818 larm_joint6> :joint-angle(93.3525) violate max-angle(89.9544)
;; #<rotational-joint #X562ba08da838 rarm_joint4> :joint-angle(151.875) violate max-angle(134.645)
#f(-69.12 -48.5325 -62.9775 27.7088 134.645 -30.3075 -8.67376 16.3687 9.51751 8.84251 134.629 -6.07501 134.629 50.4225 89.9544 -24.5025 11.07 18.225)
196.irteusgl$ (send *ri* :state :potentio-vector)
;; #<rotational-joint #X562ba03f36f8 larm_joint2> :joint-angle(134.966) violate max-angle(134.645)
;; #<rotational-joint #X562ba03f0818 larm_joint6> :joint-angle(93.3525) violate max-angle(89.9544)
;; #<rotational-joint #X562ba08da838 rarm_joint4> :joint-angle(151.875) violate max-angle(134.645)
#f(-69.7612 -32.2312 -62.9775 27.3713 134.645 -9.41624 -8.67376 16.7062 9.51751 8.84251 134.645 -6.07501 134.629 50.4225 89.9544 -24.5025 11.07 18.225)
197.irteusgl$ (send *ri* :state :potentio-vector)
;; #<rotational-joint #X562ba03f36f8 larm_joint2> :joint-angle(134.966) violate max-angle(134.645)
;; #<rotational-joint #X562ba03f0818 larm_joint6> :joint-angle(93.3525) violate max-angle(89.9544)
;; #<rotational-joint #X562ba08da838 rarm_joint4> :joint-angle(151.875) violate max-angle(134.645)
#f(-69.7612 -28.5862 -62.9775 27.3713 134.645 -2.12624 -8.67376 16.7062 9.51751 8.84251 134.645 -6.07501 134.629 50.4225 89.9544 -24.5025 11.07 18.225)
|#
