#!/usr/bin/env roseus

;; SPDX-FileCopyrightText: 2024 Michitoshi Tsubaki <michi.tsubaki.tech@gmail.com>
;; SPDX-License-Identifier: BSD-3-Clause

;; Build node ping-pong
(ros::roseus "ping-pong")

;; Load packages
(load "ping-pong-interface.l")
(load "ping-pong-speak.l")
(ros::load-ros-package "jsk_recognition_msgs")

;; Offset Parameters
(setq *time-offset* 0.10) ;; 時間分の距離オフセット．少し前に打つ

;; BALL REGION SETTING
(setq *ball-x-min-lim* -0.05) ;; 左に-5cm ;; 左右方向 (左ー，右＋)
(setq *ball-x-max-lim* 0.05)  ;; 右に 5cm
(setq *ball-y-min-lim* -0.07) ;; 上に 7cm ;; 上下方向 (上ー，下＋)
(setq *ball-y-max-lim* 0.07)  ;; 下に 7cm
(setq *ball-z-min-lim* 0.25)  ;; 手前25cm ;; 奥行き方向
(setq *ball-z-max-lim* 0.30)  ;; 奥に30cm

;; ENV REGION SETTING (just reference)
(setq *env-x-min-lim* -0.20)
(setq *env-x-max-lim* 0.20)
(setq *env-y-min-lim* -0.20)
(setq *env-y-max-lim* 0.10)
(setq *env-z-min-lim* 0.15)
(setq *env-z-max-lim* 1.00)

;; ROBOT MOTION RESTRICTION (このセンサ値のときしかボールは追いません)
(setq *space-x-min-lim* -0.15) ;;左に15cm (つまり+10cm)
(setq *space-x-max-lim* 0.15) ;;右に15cm (つまり+10cm)
(setq *space-z-min-lim* 0.10) ;;手前10cm ;;奥行き方向
(setq *space-z-max-lim* 0.40) ;;奥に40cm


;; TIMER SETTING
(setq *timer* 1) ;;*timer*秒間以上 *ball-?pos-tmp*が同一なら無効化(=0)する． ;;nilにするとバグる．

;; SPEED SETTING
(defvar *prev-ball-xpos* nil)
(defvar *prev-ball-ypos* nil)
(defvar *prev-ball-zpos* nil)
(defvar *prev-ball-time* nil)
(defvar vx nil)
(defvar vy nil)
(defvar vz nil)
(defvar *velocity-list* nil) 

;; Estimation Setting
(defvar *predicted-x* nil)
(defvar *predicted-y* nil)
(defvar *predicted-z* nil)  ;; これは常に*ball-z-max-lim*と同じ値
(defvar *time-to-arrival* nil)

;; set-init-pos
(setq *c-pose* #f(-70 40 0 0))

;; setup-position
(setq *basic-pose1* (v+ *c-pose* #f(15.0 -40 -40 70)))
(setq *basic-pose3* (v+ *c-pose* #f(-35.0 5 -40 75)))
(setq *basic-pose2* (float-vector -65 40 0 -60))

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

;; Recognition (認識系)
(defun search-ball()
  (format t "search-ball~%")
  (ros::rate 10000)
  (ros::subscribe "/centroid_publisher/output/point" geometry_msgs::PointStamped #'search-ball-cb 1)
  ;; メッセージ型をPoseStampedに変更
  (ros::advertise "/ball_prediction" geometry_msgs::PoseStamped 1)
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

;; 速度リストを更新し、2回分のデータが揃っているかを確認する関数
(defun update-velocity-list (vx vy vz)
  (if (< vz 0) ;; zの速度が負（接近中）の場合のみ
      (progn
        (push (list vx vy vz) *velocity-list*)
        (if (> (length *velocity-list*) 2)
            (setq *velocity-list* (subseq *velocity-list* 0 1)))
        (= (length *velocity-list*) 1))
    (progn
      (setq *velocity-list* nil)
      nil)))


;; 接近予測(defun predict-ball-arrival (current-x current-y current-z)
(defun predict-ball-arrival (current-x current-y current-z)
  (if (and *velocity-list* (= (length *velocity-list*) 1))
      (let* ((avg-vx (/ (apply #'+ (mapcar #'car *velocity-list*)) 1))
             (avg-vy (/ (apply #'+ (mapcar #'cadr *velocity-list*)) 1))
             (avg-vz (/ (apply #'+ (mapcar #'caddr *velocity-list*)) 1))
             (time-to-arrival (abs (/ (- current-z *ball-z-min-lim*) avg-vz)))
             (predicted-x (+ current-x (* avg-vx time-to-arrival)))
             (predicted-y (+ current-y (* avg-vy time-to-arrival))))
        
        ;; グローバル変数に予測結果を保存
        (setq *predicted-x* predicted-x)
        (setq *predicted-y* predicted-y)
        (setq *predicted-z* *ball-z-min-lim*)
        (setq *time-to-arrival* time-to-arrival)
        
        (ros::ros-info "Ball Arrival Prediction:")
        (ros::ros-info "Time to arrival: ~A seconds" time-to-arrival)
        (ros::ros-info "Predicted position - X: ~A, Y: ~A, Z: ~A"
                      predicted-x predicted-y *ball-z-min-lim*)

        ;; PoseStampedメッセージを作成してパブリッシュ
        (let ((msg (instance geometry_msgs::PoseStamped :init)))
          (send msg :header :stamp (ros::time-now))
          (send msg :header :frame_id "camera_link")
          (send (send (send msg :pose) :position) :x predicted-x)
          (send (send (send msg :pose) :position) :y predicted-y)
          (send (send (send msg :pose) :position) :z *ball-z-min-lim*)
          (send (send (send msg :pose) :orientation) :w time-to-arrival)
          (ros::publish "/ball_prediction" msg))

        (list predicted-x predicted-y time-to-arrival))
    (progn
      (ros::ros-info "Not enough velocity data for prediction")
      ;; 予測できない場合はグローバル変数をnilに設定
      (setq *predicted-x* nil)
      (setq *predicted-y* nil)
      (setq *predicted-z* nil)
      (setq *time-to-arrival* nil)
      nil)))

;; Hitting (打撃系)
;; Current Version (現在のバージョン)
;; 打撃関数1: ドライブ(バックハンド)
(defun drive-hit(x) ;;<- x is height. 引数のxは高さ
  (let ((r1 *basic-pose2*)
        (r2 (float-vector (- -110 (* 2 x)) (+ 100 x) -40 (+ 75 (* x 0.5))))
        (r3 (float-vector (- -110 (* 2 x)) (+ 110 x) -20  (+ 75 (* x 0.5))))
        (r4 (float-vector (- -120 (* 2 x)) (+ 100 x) 0 (+ 75 (* x 0.5))))
        (r5 (float-vector (- -120 (* 2 x)) (+ 80 x) 20 (+ 75 (* x 0.5))))
        (r6 (float-vector (- -120 (* 2 x)) (+ 40 x) 40 (+ 70 (* x 0.5))))
        (r7 *basic-pose2*)
        (tm 40))
    (send *ri* :angle-vector-sequence (list r1 r2 r3 r4 r5 r6 r7) (list tm tm tm tm tm tm 5000)
          :default-controller 0.0001
          :min-time 0.00001
          :minjerk-interpolation nil) ;;trueにするとバグので注意
    (send *ri* :send-cmd-vel-raw 0.008 0 0)
    (chorei)
    ;;(send *ri* :wait-interpolation)
    (send *irtviewer* :draw-objects)
    ) ;;hit
  ) ;;defun


;; 打撃関数2: プッシュ（下の方のボールを押し出す．）
(defun push-hit(x) ;;バックハンド ;;上はマイナス
  (let ((a (* x 2))
        (b (* x 0.5)))
    (setq p1 #f(-40 60 10 40)) ;;-65 40 0 -60
    (setq p2 (float-vector (+ -50 a) 55 10 (+ 35 b)))
    (setq p3 (float-vector (+ -55 a) 50 10 (+ 30 b)))
    (setq p4 (float-vector (+ -60 a) 45 10 (+ 25 b)))
    (setq p5 (float-vector (+ -65 a) 40 15 (+ 20 b)))
    (setq p6 (float-vector (+ -70 a) 30 20 (+ 15 b)))
    (setq p7 (float-vector (+ -75 a) 20 25 (+ 10 b)))
    (setq tm 30)
    (send *ri* :send-cmd-vel-raw 0.01 0 0) ;0.008
    (send *ri* :angle-vector-sequence (list p1 p2 p3 p4 p5 p6 p7 p1) (list tm tm tm tm tm tm tm 2000)
          :default-controller 0.001
          :min-time 0.00001
          :minjerk-interpolation nil
          )
    (chorei)
    (send *ri* :send-cmd-vel-raw -0.01 0 0)
    ;;(send *ri* :wait-interpolation)
    (send *irtviewer* :draw-objects)
    ) ;;let
  ) ;;defun


(defun push-hit2(x) ;;バックハンド
  (let ((a (* x 1))
        (b (* x 2)))
    (setq p1 #f(-45 40 0 30)) ;;-65 40 0 -60
    (setq p2 (float-vector (- -70 a) 30 15 (- -60 b)))
    (setq p3 (float-vector (- -80 a) 20 15 (- -60 b)))
    (setq p4 (float-vector (- -90 a) 0 15 (- -50 b)))
    (setq p5 (float-vector (- -100 a) -10 15 (- -40 b)))
    (setq p6 (float-vector (- -100 a) -20 20 (- -30 b)))
    (setq p7 (float-vector (- -100 a) 0 15 (- -50 b)))
    (setq tm 30)
    (send *ri* :send-cmd-vel-raw 0.01 0 0) ;0.008
    (send *ri* :angle-vector-sequence (list p1 p2 p3 p4 p5 p6 p7 p1) (list tm tm tm tm tm tm 500 500)
          :default-controller 0.001
          :min-time 0.00001
          :minjerk-interpolation nil
          )
    (chorei)
    (send *ri* :send-cmd-vel-raw -0.01 0 0)
    ;;(send *ri* :wait-interpolation)
    (send *irtviewer* :draw-objects)
    ) ;;let
  ) ;;defun

;; 打撃関数3: フォアドライブ
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
         :minjerk-interpolation nil)
   ;;(send *ri* :send-cmd-vel-raw 0.01 0 0) ;0.008
   (send *ri* :send-cmd-vel-raw 0.01 0 0) ;0.008
   (chorei)
   ;;(send *ri* :wait-interpolation)
   (send *irtviewer* :draw-objects)
   ) ;;let
 ) ;;defun

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
(defun pre-hit2() ;;とりあえず温泉卓球のように返球するhit関数
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
  (setq r6 (float-vector (- -120 (* 2 x)) (+ 40 x) 40 (+ 70 (* x 0.5))))
  (setq r7 *basic-pose2*)
  (setq tm 40)
  (send *ri* :angle-vector-sequence (list r1 r2 r3 r4 r5 r6 r7) (list tm tm tm tm tm tm 5000)
	:default-controller 0.0001
	:min-time 0.00001
	:minjerk-interpolation nil ;;trueにするとバグので注意
	)
  ;;(move-to 0.5 0)
  (send *ri* :send-cmd-vel-raw 0.008 0 0)
  (chorei)
  ;;(send *ri* :wait-interpolation)
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

;; Previous version of move-follow (independent(x,y) control)
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


;; Falling Point Estimation (ボールの落下予測地点の発見)
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

;; AUDIO Function
(defun chorei() ;;「チョレイ」と言う
  (send *ri* :play-sound #P"~/ping-pong-robot/src/ping-pong/srv/chorei.mp3" :wait nil)
  ) ;;メインでこっちを使う．肉声．

(defun chorei2() ;;「チョレイ」と言う
  (send *ri* :speak "cho-rei" :wait nil)
  ) ;;音声合成に時間がかかるのかこっちは少し遅くて，使い物にならない．

(defun start-voice()
    (send *ri* :play-sound #P"~/ping-pong-robot/src/ping-pong/srv/start.mp3" :wait nil)
  )

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
(setq *ball-zpos* 0) ;;奥行き
(setq *ball-lost* t)

;;main
(hari-init)
(on)
(unix:sleep 1)
(wait-pose)
(start-voice)
(unix:sleep 1)
(search-ball)
(do-until-key
 (setq *ball-lost* t)
 (setq *ball-xpos-tmp* 0)
 (setq *ball-ypos-tmp* 0)
 (setq *ball-zpos-tmp* 0) ;;奥行き
 (setq *ball-xpos* 0)
 (setq *ball-ypos* 0)
 (setq *ball-zpos* 0) ;;奥行き
 (setq *ball-time* 0)
 (let ((start-time-x (get-universal-time))
       (start-time-y (get-universal-time))
       (start-time-z (get-universal-time))
       (last-x *ball-xpos-tmp*)
       (last-y *ball-ypos-tmp*)
       (last-z *ball-zpos-tmp*))
   (while *ball-lost*
     (ros::rate 100000)
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

     ;; Ball Speed Calculation
     ;;(calculate-ball-velocity *ball-xpos-tmp* *ball-ypos-tmp* *ball-zpos-tmp* *ball-time*)
     
     ;; Debag 
     ;;(format t "x: ~A, y: ~A, z: ~A~%" *ball-xpos-tmp* *ball-ypos-tmp* *ball-zpos-tmp*)

     (if (and *predicted-x* *predicted-y* *time-to-arrival*  ; 予測値が存在する
	      (< *time-to-arrival* 0.4)                      ; 到達時間が0.2秒以内
	      (> *predicted-x* *ball-x-min-lim*)             ; x方向の予測位置が範囲内
	      (< *predicted-x* *ball-x-max-lim*)
	      (> *predicted-y* *ball-y-min-lim*)             ; y方向の予測位置が範囲内
	      (< *predicted-y* *ball-y-max-lim*))
	 (progn 
	   (setq *ball-lost* nil)
	   ;; 予測関連の変数をリセット
	   (setq *velocity-list* nil)
	   (setq *predicted-x* nil)
	   (setq *predicted-y* nil)
	   (setq *predicted-z* nil)
	   ;; 到達予測時間後に打つ
	   (if (> *time-to-arrival* 0.3)
	       (ros::duration-sleep (- *time-to-arrival* 0.3))
	     )
	   (setq *time-to-arrival* nil)
	   (push-hit 0)
	   (format t "predicted! ~%")
	   (return))                                         ; whileループを抜ける
       )

     
     ;; ボールの当たり判定
     (if (and (> *ball-xpos-tmp* *ball-x-min-lim*) ;;奥行き方向
	      (< *ball-xpos-tmp* *ball-x-max-lim*)
	      (> *ball-ypos-tmp* *ball-y-min-lim*) ;;上下方向(下が＋, )
	      (< *ball-ypos-tmp* *ball-y-max-lim*)
	      (> *ball-zpos-tmp* *ball-z-min-lim*) ;;左右方向(左がー, 右が＋)
	      (< *ball-zpos-tmp* *ball-z-max-lim*))
	 (progn (setq *ball-lost* nil) (format t "ball found ~%"))
       )
     ;; follow-x,ypos (将来的に引数には着地予測地点を入れるが今の所tmpを使う)
     (setq *estimete-falling-xpos* *ball-xpos-tmp*)
     (setq *estimete-falling-ypos* *ball-ypos-tmp*)
     (if (and (> *ball-zpos-tmp* *space-z-min-lim*)
	      (< *ball-zpos-tmp* *space-z-max-lim*)
	      (> *ball-xpos-tmp* *space-x-min-lim*)
	      (< *ball-xpos-tmp* *space-x-max-lim*))
	;; (move-follow *ball-zpos-tmp* *ball-xpos-tmp*)
       )
     ;;(ros::duration-sleep 0.001) ;; 1ms処理を休ませる
     ) ;;while
   ) ;;let
 ;;(push-hit 0)
 (unless (and *predicted-x* *time-to-arrival* (< *time-to-arrival* 0.2))
  ;; (push-hit (+ (* *ball-zpos-tmp* 2) 0.5)))
 ;;(ros::sleep)
 (ros::duration-sleep 0.2) ;;sleep 0.5 ms ;;(unix:usleep 500000) と違ってrosを止めない
 ) ;;do-until-key ;; key操作をしたらoffにして安全に止まる
)
(off)
