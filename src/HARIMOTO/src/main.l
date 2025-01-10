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
;; Setup-position (基本姿勢の定義)
(setq *basic-pose-l* #f(18 25 7 25)) ;;下で待機
(setq *basic-pose-u* #f(-60 30 -45 50)) ;;上で待機
(setq *basic-pose-f* #f(15 -140 -10 -20)) ;;フォアで待機

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
(setq *MIDDLE-max-lim* 0.65) ;; 65cm ;; HEAR should be filled!! (@Michi-Tsubaki, Jan 9)
(setq *FAR-min-lim* *MIDDLE-max-lim*)
(setq *FAR-max-lim* *env-z-max-lim*)

;; Ball Judge Region Settings
;; As for NEAR ..
(setq *NEAR-sweet-x-min-lim* -0.035) ;; 左に-5cm ;; 左右方向 (左ー，右＋)
(setq *NEAR-sweet-x-max-lim* 0.035)  ;; 右に 5cm
(setq *NEAR-sweet-y-min-lim* -0.02) ;; 上に 2cm ;; 上下方向 (上ー，下＋)
(setq *NEAR-sweet-y-max-lim* 0.07)  ;; 下に 7cm
(setq *NEAR-sweet-z-min-lim* 0.16)  ;; 手前16cm ;; 奥行き方向
(setq *NEAR-sweet-z-max-lim* 0.22)  ;; 奥に22cm ;; NEARは着地後なので近めに設定

;; As for MIDDLE ...
(setq *ball-x-min-lim* -0.05) ;; 左に-5cm ;; 左右方向 (左ー，右＋)
(setq *ball-x-max-lim* 0.05)  ;; 右に 5cm
(setq *ball-y-min-lim* -0.07) ;; 上に 7cm ;; 上下方向 (上ー，下＋)
(setq *ball-y-max-lim* 0.07)  ;; 下に 7cm
(setq *ball-z-min-lim* 0.25)  ;; 手前25cm ;; 奥行き方向
(setq *ball-z-max-lim* 0.30)  ;; 奥に30cm

;; As for FAR ...
;; この範囲にボールが来ると認識された時，sweetスポットに移動する
(setq *FAR-judge-x-min-lim* -0.1) ;; 左に-5cm ;; 左右方向 (左ー，右＋)
(setq *FAR-judge-x-max-lim* 0.1)  ;; 右に 5cm
(setq *FAR-judge-y-min-lim* -0.07) ;; 上に 7cm ;; 上下方向 (上ー，下＋)
(setq *FAR-judge-y-max-lim* 0.07)  ;; 下に 7cm
(setq *FAR-judge-z-min-lim* 0.25)  ;; 手前25cm ;; 奥行き方向
(setq *FAR-judge-z-max-lim* 0.30)  ;; 奥に30cm
;; FARのsweetスポット
(setq *FAR-sweet-x-min-lim* -0.04) ;; 左に-5cm ;; 左右方向 (左ー，右＋)
(setq *FAR-sweet-x-max-lim* 0.04)  ;; 右に 5cm
(setq *FAR-sweet-y-min-lim* -0.08) ;; 上に 7cm ;; 上下方向 (上ー，下＋)
(setq *FAR-sweet-y-max-lim* 0.08)  ;; 下に 7cm
(setq *FAR-sweet-z-min-lim* 0.25)  ;; 手前25cm ;; 奥行き方向
(setq *FAR-sweet-z-max-lim* 0.30)  ;; 奥に30cm


;; ROBOT MOTION RESTRICTION (このセンサ値のときしかボールは追いません)
(setq *space-x-min-lim* -0.15) ;;左に15cm (つまり+10cm)
(setq *space-x-max-lim* 0.15) ;;右に15cm (つまり+10cm)
(setq *space-z-min-lim* 0.10) ;;手前10cm ;;奥行き方向
(setq *space-z-max-lim* 0.40) ;;奥に40cm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Time Management (時間管理);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TIMER SETTING 
(setq *timer* 1) ;;*timer*秒間以上 *ball-?pos-tmp*が同一なら無効化(=0)する． ;;nilにするとバグる．

;; 変数の使用時間を管理する関数
(defun monitor-value (var-symbol timeout)
  (let ((start-time (get-universal-time))
        (last-value (symbol-value var-symbol)))
    (loop
     (when (not (eq last-value (symbol-value var-symbol)))
       (setf start-time (get-universal-time))
       (setf last-value (symbol-value var-symbol)))
     (when (>= (- (get-universal-time) start-time) timeout)
       (setf (symbol-value var-symbol) nil)))))

;; 現在の時間を取得する関数
(defun get-universal-time()
  ;;(+ (elt (unix:localtime) 0) (* (elt (unix:localtime) 1) 60))
  (/ (send (ros::time-now) :to-nsec) 1000000000)
  )

;; Offset Parameters
(setq *time-offset* 0.10) ;; 時間分の距離オフセット．少し前に打つ
(setq *time-offset-far* 0.10)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 速度計算と予測関係の変数の定義(一応)
;; SPEED Var (速度測定用の変数)
(defvar *prev-ball-xpos* nil)
(defvar *prev-ball-ypos* nil)
(defvar *prev-ball-zpos* nil)
(defvar *prev-ball-time* nil)

(defvar vx nil)
(defvar vy nil)
(defvar vz nil)
(defvar *velocity-list* nil) 

;; Estimation Var (着地推定用の変数)
(defvar *predicted-x* nil)
(defvar *predicted-y* nil)
(defvar *predicted-z* nil)  ;; これは常に*ball-z-max-lim*と同じ値
(defvar *time-to-arrival* nil)
(defvar *FAR-predicted-x* nil)
(defvar *FAR-predicted-y* nil)
(defvar *FAR-predicted-z* nil)  ;; これは常に*ball-z-max-lim*と同じ値
(defvar *FAR-time-to-arrival* nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Recognition Function (認識系);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun search-ball()
  (format t "search-ball~%")
  (ros::subscribe "/centroid_publisher/output/point" geometry_msgs::PointStamped #'search-ball-cb 1)
  ;; メッセージ型をPoseStampedに変更
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
      ;; 現在の値を取得
      (setq x (send (send msg :point) :x))
      (setq y (send (send msg :point) :y))
      (setq z (send (send msg :point) :z))
      (setq current-time (send (ros::time-now) :to-nsec))
      (setq *ball-xpos* x)
      (setq *ball-ypos* y)
      (setq *ball-zpos* z)
      (setq *ball-time* current-time)

      ;; 速度計算部分
      (if (and *prev-ball-xpos*
               *prev-ball-ypos*
               *prev-ball-zpos*
               *prev-ball-time*
               (> (abs (- current-time *prev-ball-time*)) 0.001))
          (let* ((dt (- current-time *prev-ball-time*))
                 (dx (- x *prev-ball-xpos*))
                 (dy (- y *prev-ball-ypos*))
                 (dz (- z *prev-ball-zpos*)))
            ;; 位置の変化量が閾値以上の場合のみ更新
            (if (>= (abs dx) 0.001) (setq vx (* (/ dx dt) 1000000000)))
            (if (>= (abs dy) 0.001) (setq vy (* (/ dy dt) 1000000000)))
            (if (>= (abs dz) 0.001) (setq vz (* (/ dz dt) 1000000000)))
	    ;; 速度のフィルタリング
	    (setq vx (filter-velocity vx 0.01))
	    (setq vy (filter-velocity vy 0.01))
	    (setq vz (filter-velocity vz 0.01))
            (ros::ros-info "ball velocity: vx:~A vy:~A vz:~A" vx vy vz)
	    ;; 速度リストを更新し、3回分データが揃ったら予測を実行
            (if (update-velocity-list vx vy vz)
                (predict-ball-arrival x y z)
	      )
	    )
	)
  

      ;; 位置情報の表示
      (ros::ros-info "ball: x-pos:~A y-pos:~A z-pos:~A time:~A" x y z current-time)
      
      ;; Global変数に現在の値を保存
      (setq *prev-ball-xpos* x)
      (setq *prev-ball-ypos* y)
      (setq *prev-ball-zpos* z)
      (setq *prev-ball-time* current-time)
      )
    )
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Speed Calculation (速度計測)
(defun calculate-ball-velocity (x y z time)
  (if (and *prev-ball-xpos*
           *prev-ball-ypos*
           *prev-ball-zpos*
           *prev-ball-time*
           (> (abs (- time *prev-ball-time*)) 0.001)) ;; dtの閾値判定
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
  (if (< (abs v) threshold)
      0
      v))

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
  (send *ri* :play-sound #P"~/ping-pong-robot/src/HARIMOTO/srv/chorei.mp3" :wait nil)
  ) ;;メインでこっちを使う．肉声．

(defun chorei2() ;;「チョレイ」と言う
  (send *ri* :speak "cho-rei" :wait nil)
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
        (r2 (float-vector -65 10 -30 35))
        (r3 (float-vector -36 0 -20 -33))
        (r4 (float-vector -20  -1.6 -10 55))
        (r5 (float-vector -18 -5 11 57))
        (r6 (float-vector -17 -10 32 58))
        (r7 *basic-pose-u*)
        (tm 40))
    (send *ri* :send-cmd-vel-raw 0.008 0 0)
    (send *ri* :angle-vector-sequence (list r1 r2 r3 r4 r5 r6 r7) (list tm tm tm tm tm tm 2000)
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
        (b (* x 0.5)))
(setq *basic-pose-l* #f(12 25 7 38)) ;;下で待機

    (setq p1 *basic-pose-l*) ;;12 25 10 40
    (setq p2 (float-vector (+ 2 a) 20 10 (+ 35 b)))
    (setq p3 (float-vector (+ -3 a) 15 10 (+ 30 b)))
    (setq p4 (float-vector (+ -7 a) 10 10 (+ 25 b)))
    (setq p5 (float-vector (+ -13 a) 5 15 (+ 20 b)))
    (setq p6 (float-vector (+ -20 a) -5 20 (+ 15 b)))
    (setq p7 (float-vector (+ -28 a) -15 25 (+ 10 b)))
    (setq tm 30)
    (send *ri* :send-cmd-vel-raw 0.008 0 0) ;0.008
    (send *ri* :angle-vector-sequence (list p1 p2 p3 p4 p5 p6 p7 p1) (list tm tm tm tm tm tm tm 2000)
          :default-controller 0.001
          :min-time 0.00001
          :minjerk-interpolation nil
          )
    (chorei)
    (send *ri* :send-cmd-vel-raw -0.008 0 0)
    ;;(send *ri* :wait-interpolation) ;;if insert this, waitされて卓球のような瞬間的な動きにならない．
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
  (setq *y-threshold-left* *ball-y-min-lim*)
  (setq *y-threshold-right* *ball-y-max-lim*)
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
   (block loop-block
	  (while *ball-lost* 
	    (ros::spin-once)
	    (setq *ball-xpos-tmp* *ball-xpos*)
	    (setq *ball-ypos-tmp* *ball-ypos*)
	    (setq *ball-zpos-tmp* *ball-zpos*)

	    ;; ボール位置のモニタリング（既存のコード）
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
	    ;; MIDDLE予測のモニタリング
	    (if (not (eq last-pred-x *predicted-x*))
		(progn
		  (setq start-time-pred-x (get-universal-time))
		  (setq last-pred-x *predicted-x*)))
	    (when (>= (- (get-universal-time) start-time-pred-x) *timer*)
	      (setq *predicted-x* nil))

	    (if (not (eq last-pred-y *predicted-y*))
		(progn
		  (setq start-time-pred-y (get-universal-time))
		  (setq last-pred-y *predicted-y*)))
	    (when (>= (- (get-universal-time) start-time-pred-y) *timer*)
	      (setq *predicted-y* nil))

	    ;; FAR予測のモニタリング
	    (if (not (eq last-far-pred-x *FAR-predicted-x*))
		(progn
		  (setq start-time-far-pred-x (get-universal-time))
		  (setq last-far-pred-x *FAR-predicted-x*)))
	    (when (>= (- (get-universal-time) start-time-far-pred-x) *timer*)
	      (setq *FAR-predicted-x* nil))

	    (if (not (eq last-far-pred-y *FAR-predicted-y*))
		(progn
		  (setq start-time-far-pred-y (get-universal-time))
		  (setq last-far-pred-y *FAR-predicted-y*)))
	    (when (>= (- (get-universal-time) start-time-far-pred-y) *timer*)
	      (setq *FAR-predicted-y* nil))

	    ;; time-to-arrivalのモニタリング
	    (if (not (eq last-pred-time *time-to-arrival*))
		(progn
		  (setq start-time-pred-time (get-universal-time))
		  (setq last-pred-time *time-to-arrival*)))
	    (when (>= (- (get-universal-time) start-time-pred-time) *timer*)
	      (setq *time-to-arrival* nil))

	    ;; FAR-time-to-arrivalのモニタリング
	    (if (not (eq last-far-pred-time *FAR-time-to-arrival*))
		(progn
		  (setq start-time-far-pred-time (get-universal-time))
		  (setq last-far-pred-time *FAR-time-to-arrival*)))
	    (when (>= (- (get-universal-time) start-time-far-pred-time) *timer*)
	      (setq *FAR-time-to-arrival* nil))

	    ;; 以上でボールの位置の算出は終了した．

	    ;; ここからは，ボールの位置に応じた予測制御
	    (cond
	     ((= *ball-zpos-tmp* 0) ( )) ;;*ball-zpos-tmpが0のとき，ボールは認識されていないので何もしない．
	     ;;FAR ;;予測してかつ動く
	     ((> *ball-zpos-tmp* *FAR-min-lim*)
	      (progn
		(if (and *FAR-predicted-x* *FAR-predicted-y* *FAR-time-to-arrival*  ; 予測値が存在する
			 (< *FAR-time-to-arrival* 0.5)                      ; 到達時間が0.4秒以内
			 (> *FAR-predicted-x* *FAR-judge-x-min-lim*)             ; x方向の予測位置が範囲内
			 (< *FAR-predicted-x* *FAR-judge-x-max-lim*)
			 (> *FAR-predicted-y* *FAR-judge-y-min-lim*)             ; y方向の予測位置が範囲内
			 (< *FAR-predicted-y* *FAR-judge-y-max-lim*))
		    (progn
		      (setq *ball-lost* nil)
		      ;;(move-to 0 *FAR-predicted-x*) ;; ボールの着地予想地点に移動する
		      (when (> *FAR-time-to-arrival* 0.4)
			(move-to 0 (* (- 0 *FAR-predicted-x*) 0.1))
			(ros::duration-sleep (- *FAR-time-to-arrival* 0.4)))
		      (if (= *hit-mode* 0) (push-hit 0) (drive-hit 0)) ;;打撃
		      (setq *velocity-list* nil)
		      (setq *FAR-predicted-x* nil)
		      (setq *FAR-predicted-y* nil)
		      (setq *FAR-predicted-z* nil)
		      (format t "FAR predicted! ~%")
		      (return-from loop-block 'finished)
		      ) ;;progn
		  ) ;; if
		) ;;progn of cond1
	      ) ;; cond1 終了
	     ;;MIDDLE ;;予測するけど動かない
	     ((and (> *ball-zpos-tmp* *MIDDLE-min-lim*) (< *ball-zpos-tmp* *MIDDLE-max-lim*))
	      (progn
		(if (and *predicted-x* *predicted-y* *time-to-arrival*  ; 予測値が存在する
			 (< *time-to-arrival* 0.5)                      ; 到達時間が0.4秒以内
			 (> *predicted-x* *ball-x-min-lim*)             ; x方向の予測位置が範囲内
			 (< *predicted-x* *ball-x-max-lim*)
			 (> *predicted-y* *ball-y-min-lim*)             ; y方向の予測位置が範囲内
			 (< *predicted-y* *ball-y-max-lim*))
		    (progn 
		      (setq *ball-lost* nil)
		      ;; 到達予測時間後に打つ
		      (if (> *time-to-arrival* 0.4)
			  (ros::duration-sleep (- *time-to-arrival* 0.4))
			)
		      (if (= *hit-mode* 0) (push-hit 0) (drive-hit 0)) ;;打撃
		      ;; 予測関連の変数をリセット
		      (setq *predicted-x* nil)
		      (setq *predicted-y* nil)
		      (setq *predicted-z* nil)
		      (setq *time-to-arrival* nil)
		      (format t "predicted! ~%")
		      (return-from loop-block 'finished) ;;whileループを抜ける
		      ) ;;progn
		  )
		) ;;progn
	      ) ;;条件2終了
	     ;;NEAR ;;予測しない
	     ((< *ball-zpos-tmp* *NEAR-max-lim*)
	      (progn
		;; まずNEARのスイートスポット判定
		(if (NEAR-is-sweet *ball-xpos-tmp* *ball-ypos-tmp* *ball-zpos-tmp*)
		    (progn 
		      (setq *ball-lost* nil) 
		      (format t "cond3 : NEAR sweet spot found ~%")
		      (if (= *hit-mode* 0) (push-hit 0) (drive-hit 0)) ;;打撃
		      )
		  ;; スイートスポットでない場合、MIDDLEと同様の予測処理を試みる
		  (if (and *predicted-x* *predicted-y* *time-to-arrival*  ; 予測値が存在する
			   (< *time-to-arrival* 0.3)                      ; 到達時間が0.4秒以内
			   (> *predicted-x* *ball-x-min-lim*)             ; x方向の予測位置が範囲内
			   (< *predicted-x* *ball-x-max-lim*)
			   (> *predicted-y* *ball-y-min-lim*)             ; y方向の予測位置が範囲内
			   (< *predicted-y* *ball-y-max-lim*))
		      (progn 
			(setq *ball-lost* nil)
			;; 到達予測時間後に打つ
			(if (= *hit-mode* 0) (push-hit 0) (drive-hit 0)) ;;打撃
			;; 予測関連の変数をリセット
			(setq *predicted-x* nil)
			(setq *predicted-y* nil)
			(setq *predicted-z* nil)
			(setq *time-to-arrival* nil)
			(format t "NEAR area but using prediction! ~%")
			(return-from loop-block 'finished)))))) ;; whileループを抜ける ;;条件3終了
	     ) ;;condによる分岐終了
	    (log-ball-state)
	    ) ;;while *ball-lost
	  ) ;;block
   ;; (if (= *hit-mode* 0) (push-hit 0) (drive-hit 0)) ;;打撃
   (ros::duration-sleep 2) ;;sleep 2 s ;;(unix:sleep 2) と違ってrosを止めない!
   ) ;; let
 ) ;;do-until-key ;; key操作をしたらoffにして安全に止まる
(off)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
