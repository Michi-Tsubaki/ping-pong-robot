(load "ping-pong-interface.l")
(hari-init)
(send *ri* :servo-on)
(send *ri* :angle-vector (send *hari* :angle-vector) 2000)


;; アングルベクターを記録する関数
(defun record-angle-vector (robot filename &optional (duration 5000))
  "Record robot angle vectors for specified duration (ms) and save to file"
  (let ((start-time (get-internal-real-time))
        (angles-list nil))
    (while (< (- (get-internal-real-time) start-time) duration)
      (push (send robot :state :angle-vector) angles-list)
      (unix:usleep (* 80 1000))) ; 80msごとに記録
    
    ;; ファイルに書き出し
    (with-open-file (f filename :direction :output)
      (dolist (angles (reverse angles-list))
        (format f "~A~%" angles)))
    t))

;; アングルベクターを読み込む関数
(defun load-angle-vectors (filename)
  "Load angle vectors from file"
  (let ((angles-list nil))
    (with-open-file (f filename)
      (let ((line nil))
        (while (setq line (read-line f nil nil))
          (push (read-from-string line) angles-list))))
    (reverse angles-list)))

;; 記録したモーションを再生する関数
(defun replay-angle-vector (robot filename)
  "Replay recorded angle vectors"
  (let ((angles-list (load-angle-vectors filename)))
    (dolist (angles angles-list)
      (send robot :angle-vector angles)
      (send robot :state) ; ロボットに反映
      (unix:usleep (* 80 1000))) ; 80msごとに再生
    t))

;; 使用例
#|
;; 記録する場合
(record-angle-vector *ri* "motion.txt" 5000) ; 5秒間記録

;; 再生する場合
(replay-angle-vector *ri* "motion.txt")
|#
