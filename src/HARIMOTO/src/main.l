#!/usr/bin/env roseus

;; SPDX-FileCopyrightText: 2024 Michitoshi Tsubaki <michi.tsubaki.tech@g.ecc.u-tokyo.ac.jp>
;; SPDX-License-Identifier: BSD-3-Clause

;; Build node ping-pong
(ros::roseus "ping-pong")

;; Load packages
(load "HARIMOTO-interface.l")
(load "HARIMOTO-speak.l")
(ros::load-ros-package "jsk_recognition_msgs")

;; parameters
(setq *ball-x-min-lim* 0.18) ;;奥行き方向
(setq *ball-x-max-lim* 0.20)
(setq *ball-y-min-lim* -0.15) ;;左右方向
(setq *ball-y-max-lim* 0.15)
(setq *ball-z-min-lim* -0.20) ;;上下方向
(setq *ball-z-max-lim* 0.20)
(setq *timer* 2) ;;*timer*秒間以上 *ball-?pos-tmp*が同一なら無効化(=0)する． ;;nilにするとバグる．


;; set-init-pos
(setq *c-pose* #f(-70 40 0 0)) 
;; setup-position
(setq *basic-pose1* (v+ *c-pose* #f(15.0 -40 -40 70)))
(setq *basic-pose2* (v+ *c-pose* #f(-35.0 5 -40 75)))

;; Basic setting
(setq *ball-lost* t)

;; Basic function
;; Servo(サーボ系)
(defun on()
  (send *ri* :servo-on)
  )
  
(defun off()
  (send *ri* :servo-off)
  )
  
(defun move(angle-vector)
  (send *ri* :angle-vector angle-vector 1000)
  (send *ri* :wait-interpolation)
  (send *irtviewer* :draw-objects)
  )

(defun wait-pose()
  (send *ri* :angle-vector *basic-pose2* 5000)
  ;;0.0 39.1838 17.955 85.9437
  ;;-70 28 -44 70
  ;;0 40 10 50
  (send *ri* :wait-interpolation)
  (send *irtviewer* :draw-objects)
  )
  
(defun keep()
  (setq *tmp* (send *ri* :state :angle-vector))
  (send *ri* :angle-vector (send *ri* :state :angle-vector) 100)
  (send *ri* :wait-interpolation)
  (send *irtviewer* :draw-objects)
  (send *ri* :servo-on)
  )


;; Recognition(認識系)
(defun search-ball()
  (format t "search-ball~%")
  (ros::rate 100000)
  (ros::subscribe "/detect_ball/cluster_decomposer/boxes" jsk_recognition_msgs::BoundingBoxArray #'search-ball-cb 1)
  (ros::spin-once)
  )

(defun search-ball-cb(msg)
  (ros::ros-info "recog: ~A balls found!  ~%" (length (send msg :boxes)))
  (if (and (> (length (send msg :boxes)) 0) (> (send (send (elt (send msg :boxes) 0) :dimensions) :x) 0) )
      (progn (ros::ros-info "recog: ~A balls found!  ~%" (length (send msg :boxes)))
	     (setq *ball-xpos* (send (send (send (elt (send msg :boxes) 0) :pose) :position) :x))
	     (setq *ball-ypos* (send (send (send (elt (send msg :boxes) 0) :pose) :position) :y))
	     (setq *ball-zpos* (send (send (send (elt (send msg :boxes) 0) :pose) :position) :z))
	     (ros::ros-info "ball: x-pos:~A y-pos:~A z-pos:~A" *ball-xpos* *ball-ypos* *ball-zpos*)
	     )
    (ros::ros-info "no ball found! ~%")
    )
  )


;; Hitting(打撃系)
;; かつての打撃関数
(defun pre-hit()
  (setq r1 *basic-pose2*)
  (setq r2 #f(-60 31 -31 60))
  (setq r3 #f(-54 34 -20  60))
  (setq r4 #f(-52 36 0 60))
  (setq r5 #f(-50 20 20 60))
  (setq r6 #f(-50 10 50 60))
  (setq r7 *basic-pose2*)
  (setq tm 40)
  (send *ri* :angle-vector-sequence (list r1 r2 r3 r4 r5 r6 r7) (list tm tm tm tm tm tm 5000)
	:default-controller 0.001
	:min-time 0.0001
	:minjerk-interpolation nil
	)
  (chorei)
  ;;(send *ri* :wait-interpolation)
  (send *irtviewer* :draw-objects)
  )

;;簡易的な打撃関数
(defun hit2() ;;とりあえず温泉卓球のように返球するhit関数
  ;;TODO: yとzを引数にしてもう少し複雑にする
  (setq r1 *basic-pose2*)
  (setq r2 #f(-110 100 -40 75))
  (setq r3 #f(-110 110 -20  75))
  (setq r4 #f(-120 100 0 75))
  (setq r5 #f(-120 80 20 75))
  (setq r6 #f(-120 50 40 70))
  (setq r7 *basic-pose2*)
  (setq tm 40)
    (send *ri* :angle-vector-sequence (list r1 r2 r3 r4 r5 r6 r7) (list tm tm tm tm tm tm 5000)
	:default-controller 0.0001
	:min-time 0.00001
	:minjerk-interpolation nil ;;trueにするとバグので注意
	)
  ;;(move-to 1 1)
  (chorei)
  
  ;;(send *ri* :wait-interpolation)
  (send *irtviewer* :draw-objects)
  )



(defun hit(x) 
  ;;TODO: yとzを引数にしてもう少し複雑にする
  (setq r1 *basic-pose2*)
  (setq r2 (float-vector (- -110 (* 2 x)) (+ 100 x) -40 (+ 75 (* x 0.5))))
  (setq r3 (float-vector (- -110 (* 2 x)) (+ 110 x) -20  (+ 75 (* x 0.5))))
  (setq r4 (float-vector (- -120 (* 2 x)) (+ 100 x) 0 (+ 75 (* x 0.5))))
  (setq r5 (float-vector (- -120 (* 2 x)) (+ 80 x) 20 (+ 75 (* x 0.5))))
  (setq r6 (float-vector (- -120 (* 2 x)) (+ 50 x) 40 (+ 70 (* x 0.5))))
  (setq r7 *basic-pose2*)
  (setq tm 30)
  (send *ri* :angle-vector-sequence (list r1 r2 r3 r4 r5 r6 r7) (list tm tm tm tm tm tm 5000)
	:default-controller 0.0001
	:min-time 0.00001
	:minjerk-interpolation nil ;;trueにするとバグので注意
	)
  ;;(move-to 0.5 0)
  (send *ri* :send-cmd-vel-raw 1 0 0)
  (chorei)
  ;;(send *ri* :wait-interpolation)
  (send *irtviewer* :draw-objects)
  )


(defun back-drive() 
  (setq r1 #f(0 42 25 95))
  (setq r2 #f(-10 38 20 90))
  (setq r3 #f(-20 30 20 80))
  (setq r4 #f(-30 20 15 80))
  (setq r5 #f(-40 10 15 80))
  (setq r6 #f(-50 10 15 70))
  (setq r7 #f(-70 28 -44 70))

  ;;(setq r1 #f(-29.5312 35.2688 -32.5687 54.54))
  ;;(setq r2 #f(-29.1937 28.08 -12.7575 54.2363))
  ;;(setq r3 #f(-34.56 15.9975 9.45001 55.215))
  ;;(setq r4 #f(-30 7.15501 26.46 46.3725))
  ;;(setq r5 #f(-30 7.15501 40.107 44.0775))
  ;;(setq r6 #f(-70 28 -44 70))
  ;;(setq tm 60)
  (send *ri* :angle-vector-sequence (list r1 r2 r3 r4 r5 r6 r7) (list 100 100 100 100 100 150 2000)
	:default-controller 0.001
	:min-time 0.0001
	:minjerk-interpolation nil
	)
  (send *ri* :wait-interpolation)
  (send *irtviewer* :draw-objects)
  )
  

;; Move(移動)
;; 以下の移動関数はデフォルトで， [10cm]が単位になっている．単位換算に注意．
(defun move-to (target-x target-y &key (vel-scale 2) (pos-threshold 0.01))
  "現在位置から相対的な距離(target-x, target-y)だけ移動する
   vel-scale: 並進速度のスケール係数(デフォルト: 2)"
  
  (let ((moved-x 0.0)  ; 既に移動した距離x
        (moved-y 0.0)  ; 既に移動した距離y
        (dt 0.05))     ; 制御周期[s]
    
    (do-until-key
     (let* ((remaining-x (- target-x moved-x))
            (remaining-y (- target-y moved-y)))
       
       ;; check
       (when (and (< (abs remaining-x) pos-threshold)
                 (< (abs remaining-y) pos-threshold))
         ;; send stop
         (send *ri* :send-cmd-vel-raw 0 0 0)
         (return-from move-to t))
       
       ;; calculate velocity
       (let ((vx (* vel-scale (if (> (abs remaining-x) pos-threshold)
                                 (/ remaining-x (abs remaining-x))
                                 0)))
             (vy (* vel-scale (if (> (abs remaining-y) pos-threshold)
                                 (/ remaining-y (abs remaining-y))
                                 0))))
         
         ;; send control
         (send *ri* :send-cmd-vel-raw vx vy 0)
         
         ;; update distance
         (setq moved-x (+ moved-x (* vx dt)))
         (setq moved-y (+ moved-y (* vy dt)))
         
         ;; wait for control
         (unix:usleep (round (* dt 1000000)))))) ;; usleepがintergerしか受け付けないので，roundで丸めたが，どうやらここにバグがあるっぽい．(Dec 30 @Michi-Tsubaki) 数値計算難しいね．
    ))

;; ボールの位置(or予測地位)に追従するように機体が動くようにする関数 (Jan 1)
(defun move-follow(x y)
  (setq *y-threshold-left* 0.03)
  (setq *y-threshold-right* -0.03)
  (setq *x-threshold-front* 0.17)
  (setq *x-threshold-back* 0.22)
  
  ;; まず x, y それぞれの方向の必要な移動を判定
  (let ((x-move (cond ((= x 0) 0)
		      ((< x *x-threshold-front*) -0.5)
                      ((> x *x-threshold-back*) 0.5)
                      (t 0)))
        (y-move (cond ((= y 0) 0)
		      ((> y *y-threshold-left*) 0.5)
                      ((< y *y-threshold-right*) -0.5)
                      (t 0))))
    
    ;; 斜め移動の場合は適切にスケール
    (when (and (not (= x-move 0)) (not (= y-move 0)))
      (setq x-move (* x-move 0.707)) ;; 1/√2
      (setq y-move (* y-move 0.707)))
    
    (send *ri* :send-cmd-vel-raw x-move y-move 0)))


;;(defun move-follow(x y)
;;  (setq *y-threshold-left* 0.03) ;;横方向
;;  (setq *y-threshold-right* -0.03)
;;  (setq *x-threshold-front* 17.0) ;;前後方向
;;  (setq *x-threshold-back* 22.0)
;;  (cond ((and (> x *x-threshold-front*) (< x *x-threshold-back*) (> y *y-threshold-left*)) (send *ri* :send-cmd-vel-raw 0 0.5 0))
;;	((and (> x *x-threshold-front*) (< x *x-threshold-back*) (< y *y-threshold-right*)) (send *ri* :send-cmd-vel-raw 0 -0.5 0))
;;	((and (> x *x-threshold-front*) (< x *x-threshold-back*) (> y *y-threshold-right*) (< y *y-threshold-left*)) (send *ri* :send-cmd-vel-raw 0 0 0))
;;	((and (< x *x-threshold-front*)  (> y *y-threshold-left*)) (send *ri* :send-cmd-vel-raw -0.5 0.5 0))
;;	((and (> x *x-threshold-back*)  (> y *y-threshold-left*)) (send *ri* :send-cmd-vel-raw 0.5 0.5 0))
;;	((and (< x *x-threshold-front*) (< y *y-threshold-right*)) (send *ri* :send-cmd-vel-raw -0.5 -0.5 0))
;;	((and (> x *x-threshold-back*) (< y *y-threshold-right*)) (send *ri* :send-cmd-vel-raw 0.5 -0.5 0))
;;	((and (> x *x-threshold-back*) (< y *y-threshold-left*) (> y *y-threshold-right*)) (send *ri* :send-cmd-vel-raw 0.5 0 0))
;;	((and (< x *x-threshold-front*) (< y *y-threshold-left*) (> y *y-threshold-right*)) (send *ri* :send-cmd-vel-raw -0.5 0 0))
;;	(t (send *ri* :send-cmd-vel-raw 0 0 0)))
;;  )


;; AUDIO Function
(defun chorei() ;;「チョレイ」と言う
  (send *ri* :play-sound #P"~/ping-pong-robot/src/HARIMOTO/srv/chorei.mp3" :wait nil)
  ) ;;メインでこっちを使う．肉声．

(defun chorei2() ;;「チョレイ」と言う
  (send *ri* :speak "cho-rei" :wait nil)
  ) ;;音声合成に時間がかかるのかこっちは少し遅くて，使い物にならない．
     

;; TIMER Function (変数の時間管理)
(defun monitor-value (var-symbol timeout)
  (let ((start-time (get-universal-time))
        (last-value (symbol-value var-symbol)))
    (loop
     (when (not (eq last-value (symbol-value var-symbol)))
       (setf start-time (get-universal-time))
       (setf last-value (symbol-value var-symbol)))
     (when (>= (- (get-universal-time) start-time) timeout)
       (setf (symbol-value var-symbol) nil)))))


(defun get-universal-time()
  (+ (elt (unix:localtime) 0) (* (elt (unix:localtime) 1) 60))
  )
	 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Initialize
(setq *ball-xpos* 0)
(setq *ball-ypos* 0)
(setq *ball-zpos* 0)

;;main
(hari-init)
(on)
(setq *ball-lost* 1)
(unix:sleep 1)
(wait-pose)
(search-ball)
(do-until-key
 (setq *ball-lost* t)
 (setq *ball-xpos-tmp* 0.19)
 (setq *ball-ypos-tmp* 0)
 (setq *ball-zpos-tmp* 0)
 (setq *ball-xpos* 0)
 (setq *ball-ypos* 0)
 (setq *ball-zpos* 0)
 (let ((start-time-x (get-universal-time))
       (start-time-y (get-universal-time))
       (start-time-z (get-universal-time))
       (last-x *ball-xpos-tmp*)
       (last-y *ball-ypos-tmp*)
       (last-z *ball-zpos-tmp*))
   (while *ball-lost*
     (progn (ros::rate 1000000)	  
	    (ros::spin-once)
	    (setq *ball-xpos-tmp* *ball-xpos*)
	    (setq *ball-ypos-tmp* *ball-ypos*)
	    (setq *ball-zpos-tmp* *ball-zpos*)
	    
	    ;; Monitor x position
	    (if (not (eq last-x *ball-xpos-tmp*))
		(progn 
		  (setq start-time-x (get-universal-time))
		  (setq last-x *ball-xpos-tmp*)))
	    (when (>= (- (get-universal-time) start-time-x) *timer*)
	      (setq *ball-xpos-tmp* 0))
	    
	    ;; Monitor y position
	    (if (not (eq last-y *ball-ypos-tmp*))
		(progn
		  (setq start-time-y (get-universal-time))
		  (setq last-y *ball-ypos-tmp*)))
	    (when (>= (- (get-universal-time) start-time-y) *timer*)
	      (setq *ball-ypos-tmp* 0))
	    
	    ;; Monitor z position
	    (if (not (eq last-z *ball-zpos-tmp*))
		(progn
		  (setq start-time-z (get-universal-time))
		  (setq last-z *ball-zpos-tmp*)))
	    (when (>= (- (get-universal-time) start-time-z) *timer*)
	      (setq *ball-zpos-tmp* 0))
	    
	    (format t "x: ~A, y: ~A, z: ~A~%" *ball-xpos-tmp* *ball-ypos-tmp* *ball-zpos-tmp*)
	    (if (and (> *ball-xpos-tmp* *ball-x-min-lim*)
		     (< *ball-xpos-tmp* *ball-x-max-lim*)
		     (> *ball-ypos-tmp* *ball-y-min-lim*)
		     (< *ball-ypos-tmp* *ball-y-max-lim*)
		     (> *ball-zpos-tmp* *ball-z-min-lim*)
		     (< *ball-zpos-tmp* *ball-z-max-lim*))
		(print (setq *ball-lost* nil))
	      )
	    )
     ;; follow-x,ypos (将来的に引数には着地予測地点を入れるが今の所tmpを使う)
     (setq *estimete-falling-xpos* *ball-xpos-tmp*)
     (setq *estimete-falling-ypos* *ball-ypos-tmp*)
     (move-follow *ball-xpos-tmp* *ball-zpos-tmp*)
     )
   )
(hit2) 
(ros::sleep)
(unix:usleep 500000)
)
(off)
