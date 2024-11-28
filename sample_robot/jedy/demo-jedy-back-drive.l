#!/usr/bin/env roseus

(load "jedy-interface.l")

(jedy-init)
(send *ri* :servo-on)
(send *jedy* :reset-pose)
(send *ri* :angle-vector (send *jedy* :angle-vector) 2000) ;;go to reset position
(unix:sleep 2) ;ラケットを持たせる

(do-until-key
 
 (setq r1 #f(-96.4575 -52.515 -70.7737 55.08 134.224 -1.14749 89.9544 30 8.23501 6.61501 134.645 -5.73751 134.645 50.4225 89.9544 -24.5025 11.07 18.225))
 (setq r2 #f(-98.3137 -56.4975 -73.3725 53.1225 110.194 22.2413 89.9544 30 8.23501 6.31126 134.645 -6.07501 134.645 50.4225 89.9544 -24.5025 11.07 18.225))
 (setq r3 #f(-98.01 -59.5012 -73.035 48.2288 96.8625 29.3963 89.9544 30 8.23501 6.31126 134.645 -5.73751 134.645 50.4225 89.9544 -24.5025 11.07 18.225))
 (setq r4 #f(-96.4575 -60.48 -73.035 42.6938 82.5525 35.2688 89.9544 30 8.23501 6.31126 134.645 -6.07501 134.645 50.4225 89.9544 -24.5025 11.07 18.225))
 (setq r5 #f(-91.4287 -60.48 -73.035 36.8213 64.3613 39.825 89.9544 30 8.23501 6.61501 134.645 -5.73751 134.645 50.4225 89.9544 -24.5025 11.07 18.225))

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

#f(-96.4575 -52.515 -70.7737 55.08 134.224 -1.14749 89.9544 14.0737 8.23501 6.61501 134.645 -5.73751 134.645 50.4225 89.9544 -24.5025 11.07 18.225)
9.irteusgl$ (send *ri* :state :potentio-vector)
;; #<rotational-joint #X562ba03f36f8 larm_joint2> :joint-angle(136.924) violate max-angle(134.645)
;; #<rotational-joint #X562ba03f1df0 larm_joint4> :joint-angle(151.2) violate max-angle(134.645)
;; #<rotational-joint #X562ba03f0818 larm_joint6> :joint-angle(93.3525) violate max-angle(89.9544)
;; #<rotational-joint #X562b9fa2b9c8 rarm_joint6> :joint-angle(93.3862) violate max-angle(89.9544)
#f(-98.3137 -56.4975 -73.3725 53.1225 110.194 22.2413 89.9544 14.0737 8.23501 6.31126 134.645 -6.07501 134.645 50.4225 89.9544 -24.5025 11.07 18.225)
10.irteusgl$ (send *ri* :state :potentio-vector)
;; #<rotational-joint #X562ba03f36f8 larm_joint2> :joint-angle(136.924) violate max-angle(134.645)
;; #<rotational-joint #X562ba03f1df0 larm_joint4> :joint-angle(151.2) violate max-angle(134.645)
;; #<rotational-joint #X562ba03f0818 larm_joint6> :joint-angle(93.3525) violate max-angle(89.9544)
;; #<rotational-joint #X562b9fa2b9c8 rarm_joint6> :joint-angle(93.0825) violate max-angle(89.9544)
#f(-98.01 -59.5012 -73.035 48.2288 96.8625 29.3963 89.9544 14.0737 8.23501 6.31126 134.645 -5.73751 134.645 50.4225 89.9544 -24.5025 11.07 18.225)
11.irteusgl$ (send *ri* :state :potentio-vector)
;; #<rotational-joint #X562ba03f36f8 larm_joint2> :joint-angle(136.924) violate max-angle(134.645)
;; #<rotational-joint #X562ba03f1df0 larm_joint4> :joint-angle(151.504) violate max-angle(134.645)
;; #<rotational-joint #X562ba03f0818 larm_joint6> :joint-angle(93.3525) violate max-angle(89.9544)
;; #<rotational-joint #X562b9fa2b9c8 rarm_joint6> :joint-angle(93.0825) violate max-angle(89.9544)
#f(-96.4575 -60.48 -73.035 42.6938 82.5525 35.2688 89.9544 13.7362 8.23501 6.31126 134.645 -6.07501 134.645 50.4225 89.9544 -24.5025 11.07 18.225)
12.irteusgl$ (send *ri* :state :potentio-vector)
;; #<rotational-joint #X562ba03f36f8 larm_joint2> :joint-angle(136.924) violate max-angle(134.645)
;; #<rotational-joint #X562ba03f1df0 larm_joint4> :joint-angle(151.2) violate max-angle(134.645)
;; #<rotational-joint #X562ba03f0818 larm_joint6> :joint-angle(93.3525) violate max-angle(89.9544)
;; #<rotational-joint #X562b9fa2b9c8 rarm_joint6> :joint-angle(93.0825) violate max-angle(89.9544)
#f(-91.4287 -60.48 -73.035 36.8213 64.3613 39.825 89.9544 13.7362 8.23501 6.61501 134.645 -5.73751 134.645 50.4225 89.9544 -24.5025 11.07 18.225)

|#
