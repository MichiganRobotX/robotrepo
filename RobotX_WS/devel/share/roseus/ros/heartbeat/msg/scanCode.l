;; Auto-generated. Do not edit!


(when (boundp 'heartbeat::scanCode)
  (if (not (find-package "HEARTBEAT"))
    (make-package "HEARTBEAT"))
  (shadow 'scanCode (find-package "HEARTBEAT")))
(unless (find-package "HEARTBEAT::SCANCODE")
  (make-package "HEARTBEAT::SCANCODE"))

(in-package "ROS")
;;//! \htmlinclude scanCode.msg.html


(defclass heartbeat::scanCode
  :super ros::object
  :slots (_msgID _date _time _teamID _lightPat _checksum ))

(defmethod heartbeat::scanCode
  (:init
   (&key
    ((:msgID __msgID) "")
    ((:date __date) "")
    ((:time __time) "")
    ((:teamID __teamID) "")
    ((:lightPat __lightPat) "")
    ((:checksum __checksum) 0)
    )
   (send-super :init)
   (setq _msgID (string __msgID))
   (setq _date (string __date))
   (setq _time (string __time))
   (setq _teamID (string __teamID))
   (setq _lightPat (string __lightPat))
   (setq _checksum (round __checksum))
   self)
  (:msgID
   (&optional __msgID)
   (if __msgID (setq _msgID __msgID)) _msgID)
  (:date
   (&optional __date)
   (if __date (setq _date __date)) _date)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:teamID
   (&optional __teamID)
   (if __teamID (setq _teamID __teamID)) _teamID)
  (:lightPat
   (&optional __lightPat)
   (if __lightPat (setq _lightPat __lightPat)) _lightPat)
  (:checksum
   (&optional __checksum)
   (if __checksum (setq _checksum __checksum)) _checksum)
  (:serialization-length
   ()
   (+
    ;; string _msgID
    4 (length _msgID)
    ;; string _date
    4 (length _date)
    ;; string _time
    4 (length _time)
    ;; string _teamID
    4 (length _teamID)
    ;; string _lightPat
    4 (length _lightPat)
    ;; int32 _checksum
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _msgID
       (write-long (length _msgID) s) (princ _msgID s)
     ;; string _date
       (write-long (length _date) s) (princ _date s)
     ;; string _time
       (write-long (length _time) s) (princ _time s)
     ;; string _teamID
       (write-long (length _teamID) s) (princ _teamID s)
     ;; string _lightPat
       (write-long (length _lightPat) s) (princ _lightPat s)
     ;; int32 _checksum
       (write-long _checksum s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _msgID
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msgID (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _date
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _date (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _time
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _time (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _teamID
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _teamID (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _lightPat
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _lightPat (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _checksum
     (setq _checksum (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get heartbeat::scanCode :md5sum-) "d47ab8bea2ce4a5939332c95bde635eb")
(setf (get heartbeat::scanCode :datatype-) "heartbeat/scanCode")
(setf (get heartbeat::scanCode :definition-)
      "string msgID
string date
string time
string teamID
string lightPat
int32 checksum
")



(provide :heartbeat/scanCode "d47ab8bea2ce4a5939332c95bde635eb")


