#!/usr/bin/env roseus

;; SPDX-FileCopyrightText: 2024 Michitoshi Tsubaki <michi.tsubaki.tech@gmail.com>
;; SPDX-License-Identifier: BSD-3-Clause

#|
# Description
This code is the main algorithm of my pong-pong-robot project!
The concept of this algorithm is shown on the issue (https://github.com/Michi-Tsubaki/ping-pong-robot/issues/14)
|#

;; Build node ping-pong
(ros::roseus "ping-pong")

;; Load packages
(load "HARIMOTO-interface.l")
(load "HARIMOTO-speak.l")
(ros::load-ros-package "jsk_recognition_msgs")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Environment Management ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setup-position
(setq *basic-pose-l* #f(18 25 7 25)) ;; setup-position for push-hit mode
(setq *basic-pose-u* #f(-60 30 -45 50)) ;; setup-position for drive-hit mode
(setq *basic-pose-f* #f(15 -140 -10 -20)) ;; setup-position for fore-hit mode

;; Enviornment Region Settings (just reference)
(setq *env-x-min-lim* -0.20)
(setq *env-x-max-lim* 0.20)
(setq *env-y-min-lim* -0.20)
(setq *env-y-max-lim* 0.10)
(setq *env-z-min-lim* 0.15)
(setq *env-z-max-lim* 1.00)

;; Area Descriptions (The boarders among NEAR, MIDDLE and FAR areas.)
(setq *NEAR-min-lim* *env-z-min-lim*)
(setq *NEAR-max-lim* 0.25) ;; 25cm ;;  HEAR should be filled!! (@Michi-Tsubaki, Jan 9)
(setq *MIDDLE-min-lim* *NEAR-max-lim*)
(setq *MIDDLE-max-lim* 0.40) ;; 65cm ;; HEAR should be filled!! (@Michi-Tsubaki, Jan 9)
(setq *FAR-min-lim* *MIDDLE-max-lim*)
(setq *FAR-max-lim* *env-z-max-lim*)

;; Ball Judge Region Settings
;; As for NEAR ..
(setq *NEAR-sweet-x-min-lim* -0.04) ;; left -5cm ;; left minus(-) , right(+)
(setq *NEAR-sweet-x-max-lim* 0.05)  ;; right 5cm
(setq *NEAR-sweet-y-min-lim* -0.06) ;; upper 2cm ;; upper minus(-), lower(+)
(setq *NEAR-sweet-y-max-lim* 0.07)  ;; lower 7cm
(setq *NEAR-sweet-z-min-lim* 0.16)  ;; front 16cm
(setq *NEAR-sweet-z-max-lim* 0.20)  ;; back  22cm

;; As for MIDDLE ...
(setq *ball-x-min-lim* -0.08) ;; left  -7cm (prev: -5cm)
(setq *ball-x-max-lim* 0.10)  ;; right 10cm (prev: 8cm)
(setq *ball-y-min-lim* -0.10) ;; upper  8cm (prev: 6cm)
(setq *ball-y-max-lim* 0.15)  ;; lower 12cm (prev: 10cm)
(setq *ball-z-min-lim* 0.18)  ;; front 25cm
(setq *ball-z-max-lim* 0.25)  ;; back  30cm

;; As for FAR ...
(setq *FAR-judge-x-min-lim* -0.25) ;; left -5cm
(setq *FAR-judge-x-max-lim* 0.30)  ;; right 5cm
(setq *FAR-judge-y-min-lim* -0.15) ;; upper 7cm
(setq *FAR-judge-y-max-lim* 0.20)  ;; lower 7cm
(setq *FAR-judge-z-min-lim* 0.18)  ;; front25cm
(setq *FAR-judge-z-max-lim* 0.25)  ;; back 30cm

;; sweet-spot for FAR
(setq *FAR-sweet-x-min-lim* -0.03) ;; left  -3cm
(setq *FAR-sweet-x-max-lim* 0.04)  ;; right  4cm
(setq *FAR-sweet-y-min-lim* -0.05) ;; upper  5cm
(setq *FAR-sweet-y-max-lim* 0.10)  ;; lower 10cm
(setq *FAR-sweet-z-min-lim* 0.22)  ;; front 22cm
(setq *FAR-sweet-z-max-lim* 0.28)  ;; back  28cm

;; ROBOT MOTION RESTRICTION
(setq *space-x-min-lim* -0.15)  ;;left -15cm
(setq *space-x-max-lim* 0.15)   ;;right 15cm
(setq *space-z-min-lim* 0.10)   ;;front 10cm 
(setq *space-z-max-lim* 0.40)   ;;back  40cm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Time Management ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TIMER SETTING 
(setq *timer* 1) ;;reset arg if this time(sec) passed

;; Time Management Function
(defun monitor-value (var-symbol timeout)
  (let ((start-time (get-universal-time))
        (last-value (symbol-value var-symbol)))
    (loop
     (when (not (eq last-value (symbol-value var-symbol)))
       (setf start-time (get-universal-time))
       (setf last-value (symbol-value var-symbol)))
     (when (>= (- (get-universal-time) start-time) timeout)
       (setf (symbol-value var-symbol) nil)))))

;; Get Time
(defun get-universal-time()
  ;;(+ (elt (unix:localtime) 0) (* (elt (unix:localtime) 1) 60))
  (/ (send (ros::time-now) :to-nsec) 1000000000)
  )

;; Offset Parameters
(setq *time-offset* 0.10) ;;this param is no more needed
(setq *time-offset-far* 0.10)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Defvar for speed calc, estimation
;; SPEED Var
(defvar *prev-ball-xpos* nil)
(defvar *prev-ball-ypos* nil)
(defvar *prev-ball-zpos* nil)
(defvar *prev-ball-time* nil)

(defvar vx nil)
(defvar vy nil)
(defvar vz nil)
(defvar *velocity-list* nil) 

;; Estimation Var
(defvar *predicted-x* nil)
(defvar *predicted-y* nil)
(defvar *predicted-z* nil)  ;; equal to *ball-z-max-lim*
(defvar *time-to-arrival* nil)
(defvar *FAR-predicted-x* nil)
(defvar *FAR-predicted-y* nil)
(defvar *FAR-predicted-z* nil)  ;; equal to *ball-z-max-lim*
(defvar *FAR-time-to-arrival* nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Recognition Function (Perception);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun search-ball()
  (format t "search-ball~%")
  (ros::subscribe "/centroid_publisher/output/point" geometry_msgs::PointStamped #'search-ball-cb 1)
  (ros::advertise "/ball_prediction" geometry_msgs::PoseStamped 1)
  (ros::advertise "/far_ball_prediction" geometry_msgs::PoseStamped 1)
  (ros::spin-once)
  )

(defun is-nan (a)
  (and (> a 0) (< a 0))
  )

(defun search-ball-cb(msg)
  (if (or (is-nan (send (send msg :point) :x))
          (is-nan (send (send msg :point) :y))
          (is-nan (send (send msg :point) :z)))
      (ros::ros-info "ball not found ~%")
    (progn
      ;; get current value
      (setq x (send (send msg :point) :x))
      (setq y (send (send msg :point) :y))
      (setq z (send (send msg :point) :z))
      (setq current-time (send (ros::time-now) :to-nsec))
      (setq *ball-xpos* x)
      (setq *ball-ypos* y)
      (setq *ball-zpos* z)
      (setq *ball-time* current-time)
      ;; *** speed calc section ***
      (if (and *prev-ball-xpos*
               *prev-ball-ypos*
               *prev-ball-zpos*
               *prev-ball-time*
               (> (abs (- current-time *prev-ball-time*)) 0.001))
          (let* ((dt (- current-time *prev-ball-time*))
                 (dx (- x *prev-ball-xpos*))
                 (dy (- y *prev-ball-ypos*))
                 (dz (- z *prev-ball-zpos*)))
            ;; filtering1
            (if (>= (abs dx) 0.001) (setq vx (* (/ dx dt) 1000000000)))
            (if (>= (abs dy) 0.001) (setq vy (* (/ dy dt) 1000000000)))
            (if (>= (abs dz) 0.001) (setq vz (* (/ dz dt) 1000000000)))
	    ;; filtering2
	    (setq vx (filter-velocity vx 0.01))
	    (setq vy (filter-velocity vy 0.01))
	    (setq vz (filter-velocity vz 0.01))
            (ros::ros-info "ball velocity: vx:~A vy:~A vz:~A" vx vy vz)
	    ;; update list
            (if (update-velocity-list vx vy vz)
                (predict-ball-arrival x y z)
	      ) ;;if
	    ) ;;let*
	) ;;if
  
      ;; debug
      (ros::ros-info "ball: x-pos:~A y-pos:~A z-pos:~A time:~A" x y z current-time)
      
      ;; save valuer
      (setq *prev-ball-xpos* x)
      (setq *prev-ball-ypos* y)
      (setq *prev-ball-zpos* z)
      (setq *prev-ball-time* current-time)
      )
    )
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Speed Calculation ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun calculate-ball-velocity (x y z time)
  (if (and *prev-ball-xpos*
           *prev-ball-ypos*
           *prev-ball-zpos*
           *prev-ball-time*
           (> (abs (- time *prev-ball-time*)) 0.001)) ;; dt threshold
      (let* ((dt (- time *prev-ball-time*))
             (dx (- x *prev-ball-xpos*))
             (dy (- y *prev-ball-ypos*))
             (dz (- z *prev-ball-zpos*)))
        ;; 位置の変化量が閾値以上の場合のみ更新
        (if (>= (abs dx) 0.001) (setq vx (/ dx dt)))
        (if (>= (abs dy) 0.001) (setq vy (/ dy dt)))
        (if (>= (abs dz) 0.001) (setq vz (/ dz dt)))
        (ros::ros-info "ball velocity: vx:~A vy:~A vz:~A" vx vy vz)))
  ;; Global変数に現在の値を保存
  (setq *prev-ball-xpos* x)
  (setq *prev-ball-ypos* y)
  (setq *prev-ball-zpos* z)
  (setq *prev-ball-time* time)
  )

(defun filter-velocity (v threshold)
  (if (and v (numberp v))  ;; vがnilでなく、数値であることを確認
      (if (< (abs v) threshold)
          0
          v)
    0))  ;; nilや数値以外の場合は0を返す

;; 速度リストを更新し、3回分のデータが揃っているかを確認する関数
(defun update-velocity-list (vx vy vz)
  (if (< vz 0) ;; zの速度が負（接近中）の場合のみ
      (progn
        (push (list vx vy vz) *velocity-list*)
        (if (> (length *velocity-list*) 3)
            (setq *velocity-list* (subseq *velocity-list* 0 3)))
        (= (length *velocity-list*) 3))
    (progn
      (setq *velocity-list* nil)
      nil)
    )
  )


;; 接近予測
(defun reset-predictions ()
  (setq *predicted-x* nil)
  (setq *predicted-y* nil)
  (setq *predicted-z* nil)
  (setq *time-to-arrival* nil)
  (setq *FAR-predicted-x* nil)
  (setq *FAR-predicted-y* nil)
  (setq *FAR-predicted-z* nil)
  (setq *FAR-time-to-arrival* nil))

(defun predict-ball-arrival (current-x current-y current-z)
  (when (or (not vz) (= vz 0))  ;; 0除算防止
    (reset-predictions)
    (return-from predict-ball-arrival nil))
    
  (if (and *velocity-list* (= (length *velocity-list*) 3))
      (progn
        (let* ((avg-vx (/ (apply #'+ (mapcar #'car *velocity-list*)) 3))
               (avg-vy (/ (apply #'+ (mapcar #'cadr *velocity-list*)) 3))
               (avg-vz (/ (apply #'+ (mapcar #'caddr *velocity-list*)) 3))
               ;; 平均を使わない方
               (time-to-arrival (abs (/ (- current-z *ball-z-min-lim*) vz)))
               (predicted-x (+ current-x (* vx time-to-arrival)))
               (predicted-y (+ current-y (* vy time-to-arrival)))
               ;; 平均を使う方
               (FAR-time-to-arrival (abs (/ (- current-z *ball-z-min-lim*) avg-vz)))
               (FAR-predicted-x (+ current-x (* avg-vx time-to-arrival)))
               (FAR-predicted-y (+ current-y (* avg-vy time-to-arrival))))
          
          ;; グローバル変数に予測結果を保存
          (setq *predicted-x* predicted-x)
          (setq *predicted-y* predicted-y)
          (setq *predicted-z* *ball-z-min-lim*)
          (setq *time-to-arrival* time-to-arrival)
          (setq *FAR-predicted-x* FAR-predicted-x)
          (setq *FAR-predicted-y* FAR-predicted-y)
          (setq *FAR-predicted-z* *ball-z-min-lim*)
          (setq *FAR-time-to-arrival* FAR-time-to-arrival)
          
          (ros::ros-info "Ball Arrival Prediction:")
          (ros::ros-info "Time to arrival: SIMPLE: ~A seconds, AVG: ~A seconds" 
                        time-to-arrival FAR-time-to-arrival)
          (ros::ros-info "Predicted position - X: ~A, Y: ~A, Z: ~A"
                        predicted-x predicted-y *ball-z-min-lim*)
          (ros::ros-info "FAR Predicted position - X: ~A, Y: ~A, Z: ~A"
                        FAR-predicted-x FAR-predicted-y *ball-z-min-lim*)

          ;; PoseStamped MSGを作成してPublish
          (let ((msg (instance geometry_msgs::PoseStamped :init)))
            (send msg :header :stamp (ros::time-now))
            (send msg :header :frame_id "camera_link")
            (send (send (send msg :pose) :position) :x predicted-x)
            (send (send (send msg :pose) :position) :y predicted-y)
            (send (send (send msg :pose) :position) :z *ball-z-min-lim*)
            (send (send (send msg :pose) :orientation) :w time-to-arrival)
            (ros::publish "/ball_prediction" msg))
          
          ;; FARの方もPublish
          (let ((msg (instance geometry_msgs::PoseStamped :init)))
            (send msg :header :stamp (ros::time-now))
            (send msg :header :frame_id "camera_link")
            (send (send (send msg :pose) :position) :x FAR-predicted-x)
            (send (send (send msg :pose) :position) :y FAR-predicted-y)
            (send (send (send msg :pose) :position) :z *ball-z-min-lim*)
            (send (send (send msg :pose) :orientation) :w FAR-time-to-arrival)
            (ros::publish "/far_ball_prediction" msg))

          (list FAR-predicted-x FAR-predicted-y FAR-time-to-arrival)))
      
      (progn  ;; velocity-listが無い場合
        (if (and vx vy vz)  ;; 速度データが有効な場合
            (let* ((time-to-arrival (abs (/ (- current-z *ball-z-min-lim*) vz)))
                   (predicted-x (+ current-x (* vx time-to-arrival)))
                   (predicted-y (+ current-y (* vy time-to-arrival))))	
              ;; グローバル変数に予測結果を保存
              (setq *predicted-x* predicted-x)
              (setq *predicted-y* predicted-y)
              (setq *predicted-z* *ball-z-min-lim*)
              (setq *time-to-arrival* time-to-arrival)
              
              (ros::ros-info "Ball Arrival Prediction:")
              (ros::ros-info "Time to arrival: SIMPLE: ~A seconds" time-to-arrival)
              (ros::ros-info "Predicted position - X: ~A, Y: ~A, Z: ~A"
                            predicted-x predicted-y *ball-z-min-lim*)
              
              ;; PoseStamped MSGを作成してPublish
              (let ((msg (instance geometry_msgs::PoseStamped :init)))
                (send msg :header :stamp (ros::time-now))
                (send msg :header :frame_id "camera_link")
                (send (send (send msg :pose) :position) :x predicted-x)
                (send (send (send msg :pose) :position) :y predicted-y)
                (send (send (send msg :pose) :position) :z *ball-z-min-lim*)
                (send (send (send msg :pose) :orientation) :w time-to-arrival)
                (ros::publish "/ball_prediction" msg))
              
              (list predicted-x predicted-y time-to-arrival))
            ;; 速度データが無効な場合
            (progn
              (reset-predictions)
              nil)))))
  
;; 待機時間計算
(defun calculate-wait-time (velocity time-to-arrival)
  "ボールの速度に応じて待ち時間を調整する関数"
  (let* ((speed (sqrt (+ (* vx vx) (* vy vy) (* vz vz))))
        (base-wait-time (- time-to-arrival 0.1)) ;; 基本待ち時間
        (speed-factor (cond
                      ((> speed 0.8) 0.02)  ;; 高速: より短い待ち時間
                      ((> speed 0.5) 0.07)  ;; 中速
                      (t 0.1))))            ;; 低速: 通常の待ち時間
    (max 0.05 (* base-wait-time speed-factor)))) ;; 最小待ち時間は0.05秒
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Falling Point Estimation (ボールの落下予測地点の発見);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun falling-estimation()
  (format t "search falling point!~%")
  (ros::rate 10000)
  (ros::subscribe "/predicted_landing_point" geometry_msgs::Point #'falling-cb 1)
  (ros::spin-once)
  )

(defun falling-cb(msg)
  (setq *falling-point-x* (send msg :x))
  (setq *falling-point-y* (send msg :y))
  (setq *falling-point-z* (send msg :z)) ;;奥行き
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Judgement of sweet-spot (スイートスポットの判定);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun NEAR-is-sweet(x y z)
  (if (and (> x *NEAR-sweet-x-min-lim*)
	   (< x *NEAR-sweet-x-max-lim*)
	   (> y *NEAR-sweet-y-min-lim*)
	   (< y *NEAR-sweet-y-max-lim*)
	   (> z *NEAR-sweet-z-min-lim*)
	   (< z *NEAR-sweet-z-max-lim*))
      t
    nil)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AUDIO Function (音声に関する関数);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun chorei() ;;「チョレイ」と言う
  (ros::spin-once)
  (if (and (> vy 0))
      (send *ri* :play-sound #P"~/ping-pong-robot/src/HARIMOTO/srv/chorei.mp3" :wait  nil)
    )
  ) ;;音声合成に時間がかかるのかこっちは少し遅くて，使い物にならない．

(defun start-voice() ;;「お相手しましょう」と言う
    (send *ri* :play-sound #P"~/ping-pong-robot/src/HARIMOTO/srv/start.mp3" :wait nil)
  )

(defun play-warning() ;; 警告音を鳴らす関数
  (send *ri* :play-sound #P"~/ping-pong-robot/src/HARIMOTO/srv/warn.mp3" :wait nil)
)

;; Warning (警告);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 赤サーボにトルクがかかりすぎると故障するので，開始2分後と5分後に警告を鳴らす．
(defun check-warning-times()
  (when (and *start-time* (not *warning-2min-played*))
    (let ((elapsed-time (- (get-universal-time) *start-time*)))
      (when (>= elapsed-time 120) ; 2 minutes = 120 seconds
        (play-warning)
        (setq *warning-2min-played* t)
	)
      )
    )
  (when (and *start-time* (not *warning-5min-played*))
    (let ((elapsed-time (- (get-universal-time) *start-time*)))
      (when (>= elapsed-time 300) ; 5 minutes = 300 seconds
        (play-warning)
        (setq *warning-5min-played* t)
	)
      )
    )
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Arm Motion Function (アームの動きに関係する関数) ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
  (send *ri* :angle-vector *basic-pose* 5000)
  (send *ri* :wait-interpolation)
  (send *irtviewer* :draw-objects)
  )
  
(defun keep()
  (setq *tmp* (send *ri* :state :angle-vector)) ;;*tmp*に記録
  (send *ri* :angle-vector (send *ri* :state :angle-vector) 100)
  (send *ri* :wait-interpolation)
  (send *irtviewer* :draw-objects)
  (send *ri* :servo-on)
  )

;; Hitting (打撃系)
;; Current Version (現在のバージョン)
;; 打撃関数1: ドライブ(バックハンドドライブ)

(defun drive-hit(x) ;;<- x is height. 引数のxは高さ ;;developping
  (let ((r1 *basic-pose-u*) ;;-65 0 -30 35
        (r2 (float-vector -55 5 -35 35))
        (r3 (float-vector -52 10 -15 35))
        (r4 (float-vector -49  15 0 35))
        (r5 (float-vector -47 20 20 35))
        (r6 (float-vector -45 20 40 35))
        (r7 *basic-pose-u*)
        (tm 30))
    (send *ri* :send-cmd-vel-raw 0.008 0 0)
    (send *ri* :angle-vector-sequence (list r1 r2 r3 r4 r5 r6 r7) (list (* tm 2) tm tm tm tm tm 2000)
          :default-controller 0.0001
          :min-time 0.00001
          :minjerk-interpolation nil) 
    (chorei)
    ;;(send *ri* :wait-interpolation) ;;if insert this, waitされて卓球のような瞬間的な動きにならない．
    (send *ri* :send-cmd-vel-raw -0.008 0 0)
    (send *irtviewer* :draw-objects)
    ) ;;let
  ) ;;defun


;; 打撃関数2: プッシュ（下の方のボールを押し出す．温泉卓球）
(defun push-hit(x) ;;バックハンド ;;上はマイナス
  (let ((a (* x 2))
        (b (* x 0.5))
	(p1 *basic-pose-l*) ;;12 25 10 40
	(p2 (float-vector (+ 2 x) 20 10 (+ 30 x)))
	(p3 (float-vector (+ -3 x) 10 10 (+ 20 x)))
	(p4 (float-vector (+ -7 x) 0 10 (+ 10 x)))
	(p5 (float-vector (+ -13 x) -5 15 (+ -0 x)))
	(p6 (float-vector (+ -20 x) -10 20 (+ -15 x)))
	(p7 (float-vector (+ -35 x) -20 25 (+ -35 x)))
	(tm 25))
    (send *ri* :send-cmd-vel-raw 0.01 0 0) ;0.008
    (send *ri* :angle-vector-sequence (list p1 p2 p3 p4 p5 p6 p7 p1) (list tm tm tm tm tm tm tm 2000)
          :default-controller 0.001
          :min-time 0.00001
          :minjerk-interpolation nil
          )
    (chorei)
    (ros::duration-sleep 0.5)
    (send *ri* :send-cmd-vel-raw -0.01 0 0)
    ;;(send *ri* :wait-interpolation) ;;if insert this, waitれて卓球のような瞬間的な動きにならない．
    (send *irtviewer* :draw-objects)
    ) ;;let
  ) ;;defun

(defun push-hit-prev(x) ;;バックハンド ;;上はマイナス
  (let ((a (* x 2))
        (b (* x 0.5)))
    (setq n1 *basic-pose-l*) ;;12 25 10 40
    (setq n2 (float-vector (+ 2 a) 20 10 (+ 35 b)))
    (setq n3 (float-vector (+ -3 a) 15 10 (+ 30 b)))
    (setq n4 (float-vector (+ -7 a) 10 10 (+ 25 b)))
    (setq n5 (float-vector (+ -13 a) 5 15 (+ 20 b)))
    (setq n6 (float-vector (+ -20 a) -5 20 (+ 15 b)))
    (setq n7 (float-vector (+ -28 a) -15 25 (+ 10 b)))
    (setq tm 30)
    (send *ri* :send-cmd-vel-raw 0.01 0 0) ;0.008
    (send *ri* :angle-vector-sequence (list n1 n2 n3 n4 n5 n6 n7 n1) (list tm tm tm tm tm tm tm 2000)
          :default-controller 0.001
          :min-time 0.00001
          :minjerk-interpolation nil
          )
    (chorei)
    (ros::duration-sleep 0.5)
    (send *ri* :send-cmd-vel-raw -0.01 0 0)
    ;;(send *ri* :wait-interpolation) ;;if insert this, waitれて卓球のような瞬間的な動きにならない．
    (send *irtviewer* :draw-objects)
    ) ;;let
  ) ;;defun


;; 打撃関数3: フォアドライブ(今回は使わない)
(defun fore-hit(x) ;;バックハンド
 (let ((a (* x 1))
       (b (* x 2))
       (p1 #f(-65 40 0 -60))
       (p2 (float-vector -50 -130 0 -20))
       (p3 (float-vector -55 -120 2 -15))
       (p4 (float-vector -60 -110 5 -10))
       (p5 (float-vector -70 -100 10 0))
       (p6 (float-vector -80 -90 15 20))
       (p7 (float-vector -95 -80 20 25))
       (tm 40))
   (send *ri* :angle-vector-sequence 
         (list p1 p2 p3 p4 p5 p6 p7 p1) 
         (list 100 500 tm tm tm tm tm 2000)
         :default-controller 0.001
         :min-time 0.00001
         :minjerk-interpolation nil) ;; tにするとバグる．
   (chorei)
   ;;(send *ri* :wait-interpolation) ;;wait補完をするとバグる．
   (send *irtviewer* :draw-objects)
   ) ;;let
 ) ;;defun
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Move(足回りの移動)関数 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 以下の移動関数はデフォルトで， [10cm]が単位になっている．単位換算に注意．
;; 指定された位置に移動する関数
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
  (setq *y-threshold-left* *FAR-sweet-x-min-lim*) ;;左
  (setq *y-threshold-right* *FAR-sweet-x-max-lim*) ;;右
  (setq *x-threshold-front* *FAR-sweet-y-max-lim*) ;;上
  (setq *x-threshold-back* *FAR-sweet-y-min-lim*) ;;下
  ;; debug
  (format t "===== move-follow debug =====~%")
  (format t "Input x: ~A, y: ~A~%" x y)
  (format t "Thresholds: left=~A, right=~A~%" 
          *y-threshold-left* *y-threshold-right*)
  ;; chack nil
  (let ((safe-x (if (numberp x) x 0))
        (safe-y (if (numberp y) y 0)))
    ;; calc
    (let ((x-move (cond ((= safe-x 0) 0)
                        ((> safe-x *x-threshold-front*) 1)
                        ((< safe-x *x-threshold-back*) 1)
                        (t 0)))
          (y-move (cond ((= safe-y 0) 0)
                        ((> safe-y *y-threshold-right*) 1)
                        ((< safe-y *y-threshold-left*) -1)
                        (t 0))))
      ;; normalization
      (when (and (not (= x-move 0)) (not (= y-move 0)))
        (setq x-move (* x-move 0.707))
        (setq y-move (* y-move 0.707))
	) ;;when
      ;; send cmd_vel
      (send *ri* :send-cmd-vel-raw x-move y-move 0)
      ) ;;let
    ) ;;let
  ) ;;defun

#|(defun move-follow(x y)
  (setq *y-threshold-left* *FAR-sweet-x-min-lim*)
  (setq *y-threshold-right* *FAR-sweet-x-max-lim*)
  (setq *x-threshold-front* *ball-z-min-lim*)
  (setq *x-threshold-back* *ball-z-max-lim*)
  
  ;; まず x, y それぞれの方向の必要な移動を判定
  (let ((x-move (cond ((= x 0) 0) ;;上下
		      ((< x *x-threshold-front*) -0.5)
                      ((> x *x-threshold-back*) 0.5)
                      (t 0)))
        (y-move (cond ((= y 0) 0) ;;左右
		      ((> y *y-threshold-left*) -0.5)
                      ((< y *y-threshold-right*) 0.5)
                      (t 0))))

    (format t "x:~A, y:~A ~%" x y)
    ;; 斜め移動の場合は適切にスケール
    (when (and (not (= x-move 0)) (not (= y-move 0))) ;;xは前
      (setq x-move (* x-move 0.707)) ;; 1/√2
      (setq y-move (* y-move 0.707)))
    
    (send *ri* :send-cmd-vel-raw x-move y-move 0)
    )
  )
|#

;;Debug
(defun log-ball-state ()
  (format t "==== Ball State ====~%")
  (format t "Position: (x:~A, y:~A, z:~A)~%" *ball-xpos-tmp* *ball-ypos-tmp* *ball-zpos-tmp*)
  (format t "Velocity: (vx:~A, vy:~A, vz:~A)~%" vx vy vz)
  (format t "Predictions: ~%")
  (format t "  MIDDLE: (x:~A, y:~A, t:~A)~%" *predicted-x* *predicted-y* *time-to-arrival*)
  (format t "  FAR: (x:~A, y:~A, t:~A)~%" *FAR-predicted-x* *FAR-predicted-y* *FAR-time-to-arrival*)
  (format t "==================~%")
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Main (メインコード)

;; Initialize (初期化)
(setq *ball-xpos* 0)
(setq *ball-ypos* 0)
(setq *ball-zpos* 0) ;;奥行き
(setq *ball-lost* t)
(setq *start-time* (get-universal-time))
(setq *warning-2min-played* nil)
(setq *warning-5min-played* nil)

;; MAIN
(hari-init) ;; Robot Modelの初期化
(setq *mode-value* (elt (send *ri* :state :angle-vector) 0))
;; Mode Setting (モード設定)
(if (< *mode-value* -10) ;;腕のサーボの値が-10よりも小さい時(上がっている時)
    (progn (setq *basic-pose* *basic-pose-u*) (setq *hit-mode* 1)) ;; Drive Mode
  (progn (setq *basic-pose* *basic-pose-l*) (setq *hit-mode* 0)) ;; Push Mode
  ) 

(on) ;; サーボon
(ros::duration-sleep 1) ;; 1秒間待機 (ミリ秒じゃなくて秒)

(wait-pose) ;; 初期姿勢に移動する(モードによって異なる．)
(start-voice) ;; 準備が完了したら「お相手しましょう」というボイスを鳴らす．
(ros::duration-sleep 1) ;; 1秒間待機
(ros::rate 10000) ;; ros rate は10000で固定
(search-ball) ;; centroidのtopicのsubscribeを開始
(do-until-key ;; ここからは繰り返し動作
 (check-warning-times) ;; 起動時間の累計時間 -> 警告 (フェールセーフ)
 (setq *ball-lost* t) ;; ループの先頭に戻ってきた = ボールを再び見失った．
 ;; 制御に使う*ball-ipos-tmp*を初期化(→次の(ros::spin-onceで更新)
 (setq *ball-xpos-tmp* 0) ;; 左右
 (setq *ball-ypos-tmp* 0) ;; 上下
 (setq *ball-zpos-tmp* 0) ;; 奥行き
 (setq *ball-xpos* 0) ;; 左右
 (setq *ball-ypos* 0) ;; 上下
 (setq *ball-zpos* 0) ;; 奥行き
 (setq *ball-time* 0) ;; 時間
 (let ((start-time-x (get-universal-time))
       (start-time-y (get-universal-time))
       (start-time-z (get-universal-time))
       (start-time-pred-x (get-universal-time))
       (start-time-pred-y (get-universal-time))
       (start-time-pred-time (get-universal-time))
       (start-time-far-pred-x (get-universal-time))
       (start-time-far-pred-y (get-universal-time))
       (start-time-far-pred-time (get-universal-time))
       (last-x *ball-xpos-tmp*)
       (last-y *ball-ypos-tmp*)
       (last-z *ball-zpos-tmp*)
       (last-pred-x *predicted-x*)
       (last-pred-y *predicted-y*)
       (last-pred-time *time-to-arrival*)
       (last-far-pred-x *FAR-predicted-x*)
       (last-far-pred-y *FAR-predicted-y*)
       (last-far-pred-time *FAR-time-to-arrival*))
   ;; Loop Process
   (block loop-block
	  (while *ball-lost* 
	    (ros::spin-once)
	    (setq *ball-xpos-tmp* *ball-xpos*)
	    (setq *ball-ypos-tmp* *ball-ypos*)
	    (setq *ball-zpos-tmp* *ball-zpos*)

	    ;; Monitoring
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
	    ;; Monitor *predicted-x*
	    (if (not (eq last-pred-x *predicted-x*))
		(progn
		  (setq start-time-pred-x (get-universal-time))
		  (setq last-pred-x *predicted-x*)))
	    (when (>= (- (get-universal-time) start-time-pred-x) *timer*)
	      (setq *predicted-x* nil))
	    ;; Monitor *predicted-y*
	    (if (not (eq last-pred-y *predicted-y*))
		(progn
		  (setq start-time-pred-y (get-universal-time))
		  (setq last-pred-y *predicted-y*)))
	    (when (>= (- (get-universal-time) start-time-pred-y) *timer*)
	      (setq *predicted-y* nil))
	    ;; Monitor *FAR-predicted-x*
	    (if (not (eq last-far-pred-x *FAR-predicted-x*))
		(progn
		  (setq start-time-far-pred-x (get-universal-time))
		  (setq last-far-pred-x *FAR-predicted-x*)))
	    (when (>= (- (get-universal-time) start-time-far-pred-x) *timer*)
	      (setq *FAR-predicted-x* nil))
	    ;; Monitor *FAR-predicted-y*
	    (if (not (eq last-far-pred-y *FAR-predicted-y*))
		(progn
		  (setq start-time-far-pred-y (get-universal-time))
		  (setq last-far-pred-y *FAR-predicted-y*)))
	    (when (>= (- (get-universal-time) start-time-far-pred-y) *timer*)
	      (setq *FAR-predicted-y* nil))
	    ;; Monitor *time-to-arrival*
	    (if (not (eq last-pred-time *time-to-arrival*))
		(progn
		  (setq start-time-pred-time (get-universal-time))
		  (setq last-pred-time *time-to-arrival*)))
	    (when (>= (- (get-universal-time) start-time-pred-time) *timer*)
	      (setq *time-to-arrival* nil))
	    ;; Monitor *FAR-time-to-arrival*
	    (if (not (eq last-far-pred-time *FAR-time-to-arrival*))
		(progn
		  (setq start-time-far-pred-time (get-universal-time))
		  (setq last-far-pred-time *FAR-time-to-arrival*)))
	    (when (>= (- (get-universal-time) start-time-far-pred-time) *timer*)
	      (setq *FAR-time-to-arrival* nil))

	    ;; \begin{section} of Prediction and Hit
	    (cond
	     ((> *ball-zpos-tmp* *FAR-min-lim*)
	      (progn
		(if (and *FAR-predicted-x* 
			 (numberp *FAR-predicted-x*)  ; Ensure be a number
			 *FAR-predicted-y* 
			 *FAR-time-to-arrival*
			 (< *FAR-time-to-arrival* 0.6)
			 (> *FAR-predicted-x* *FAR-judge-x-min-lim*)
			 (< *FAR-predicted-x* *FAR-judge-x-max-lim*)
			 (> *FAR-predicted-y* *FAR-judge-y-min-lim*)
			 (< *FAR-predicted-y* *FAR-judge-y-max-lim*))
		    (progn
		      (setq *ball-lost* nil)
		      ;; Safely handle the movement calculation
		      (move-follow *FAR-predicted-y*  (* -1 *FAR-predicted-x*))
		      (when (> *FAR-time-to-arrival* 0.15)
			(let ((wait-time (- *FAR-time-to-arrival* 0.1)))
			  (ros::duration-sleep wait-time)
			  (move-follow *FAR-predicted-y*  (* -1 *FAR-predicted-x*))
			  ;;(ros::duration-sleep wait-time)
			  (format t "sleep ~A s~%" wait-time)))
		      (if (= *hit-mode* 0) (push-hit (* *FAR-predicted-y* 45)) (drive-hit 0))
		      (setq *velocity-list* nil)
		      (setq *FAR-predicted-x* nil)
		      (setq *FAR-predicted-y* nil)
		      (setq *FAR-predicted-z* nil)
		      (format t "FAR predicted! ~%")
		      (return-from loop-block 'finished))
		  
		  ;; FAR予測が無効な場合、MIDDLE予測を試みる
		  (if (and *predicted-x* *predicted-y* *time-to-arrival*
			   (< *time-to-arrival* 0.5)
			   (> *predicted-x* *ball-x-min-lim*)
			   (< *predicted-x* *ball-x-max-lim*)
			   (> *predicted-y* *ball-y-min-lim*)
			   (< *predicted-y* *ball-y-max-lim*))
		      (progn
			(setq *ball-lost* nil)
			(move-follow *predicted-y* (* (- 0 *predicted-x*) 1))
			(when (> *time-to-arrival* 0.3)
			  (let ((wait-time (- *time-to-arrival* 0.2)))
			    (ros::duration-sleep wait-time)
			    (format t "sleep ~A s~%" wait-time)))
			(if (= *hit-mode* 0) (push-hit (* *predicted-y* 45)) (drive-hit 0))
			(setq *predicted-x* nil)
			(setq *predicted-y* nil)
			(setq *predicted-z* nil)
			(setq *time-to-arrival* nil)
			(format t "FAR predicted(Middle Mode)! ~%")
			(return-from loop-block 'finished))))));; end of cond1
	    ;;MIDDLE(cond2)
	    ((and (> *ball-zpos-tmp* *MIDDLE-min-lim*) (< *ball-zpos-tmp* *MIDDLE-max-lim*))
	     (progn
	       (if (and *predicted-x* *predicted-y* *time-to-arrival*  ; estimated!
			(< *time-to-arrival* 0.5)                      ; arrive in 0.4 sec
			(> *predicted-x* *ball-x-min-lim*)             ; x
			(< *predicted-x* *ball-x-max-lim*)
			(> *predicted-y* *ball-y-min-lim*)             ; y
			(< *predicted-y* *ball-y-max-lim*))
		   (progn 
		     (setq *ball-lost* nil)
		     (move-follow *predicted-y* (* (- 0 *predicted-x*) 1))
		     (when (> *time-to-arrival* 0.2)
		       (let ((wait-time (calculate-wait-time vz *time-to-arrival*)))
			 ;;(move-follow *predicted-y* (* (- 0 *predicted-x*) 1))
			 (ros::duration-sleep wait-time)
			 (move-follow *predicted-y* (* (- 0 *predicted-x*) 1))
			 (format t "sleep ~A s~%" wait-time)
			 )
		       )
		     ;; hit
		     (if (= *hit-mode* 0) (push-hit (* *predicted-y* 45)) (drive-hit 0))
		     ;; reset arg
		     (setq *predicted-x* nil)
		     (setq *predicted-y* nil)
		     (setq *predicted-z* nil)
		     (setq *time-to-arrival* nil)
		     (format t "predicted! ~%")
		     (return-from loop-block 'finished) ;; break while loop
		     ) ;;progn
		 )
	       ) ;;progn
	     ) ;; end of cond2
	    ;;NEAR (cond3)
	    ((< *ball-zpos-tmp* *NEAR-max-lim*)
	     (progn
	       ;; if sweetspot
	       (if (NEAR-is-sweet *ball-xpos-tmp* *ball-ypos-tmp* *ball-zpos-tmp*)
		   (progn 
		      (setq *ball-lost* nil) 
		      (format t "cond3 : NEAR sweet spot found ~%")
		      ;; hit
		      (if (= *hit-mode* 0) (push-hit 0) (drive-hit 0))
		      )
		  ;; if not sweetspot, predict as middle process
		  (if (and *predicted-x* *predicted-y* *time-to-arrival*  ; 予測値が存在する
			   (< *time-to-arrival* 0.3)                      ; 到達時間が0.4秒以内
			   (> *predicted-x* *ball-x-min-lim*)             ; x方向の予測位置が範囲内
			   (< *predicted-x* *ball-x-max-lim*)
			   (> *predicted-y* *ball-y-min-lim*)             ; y方向の予測位置が範囲内
			   (< *predicted-y* *ball-y-max-lim*)
			   ) ;;and
		      (progn 
			(setq *ball-lost* nil)
			;; hit
			(if (= *hit-mode* 0) (push-hit 0) (drive-hit 0))
			;; reset arg
			(setq *predicted-x* nil)
			(setq *predicted-y* nil)
			(setq *predicted-z* nil)
			(setq *time-to-arrival* nil)
			(format t "NEAR area but using prediction! ~%")
			(return-from loop-block 'finished)
			) ;;progn
		    ) ;;if
		  ) ;;if
	       ) ;;progn
	     ) ;;end cond3
	     ) ;;cond
	    (log-ball-state)
	    ) ;;while *ball-lost
	  ) ;;block
   ;; (if (= *hit-mode* 0) (push-hit 0) (drive-hit 0))
   (ros::duration-sleep 2) ;;sleep 2 s ;; x (unix:sleep 2)
   ) ;; let
 ) ;;do-until-key
(off)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
