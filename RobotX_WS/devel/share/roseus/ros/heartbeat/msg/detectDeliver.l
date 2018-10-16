;; Auto-generated. Do not edit!


(when (boundp 'heartbeat::detectDeliver)
  (if (not (find-package "HEARTBEAT"))
    (make-package "HEARTBEAT"))
  (shadow 'detectDeliver (find-package "HEARTBEAT")))
(unless (find-package "HEARTBEAT::DETECTDELIVER")
  (make-package "HEARTBEAT::DETECTDELIVER"))

(in-package "ROS")
;;//! \htmlinclude detectDeliver.msg.html


(defclass heartbeat::detectDeliver
  :super ros::object
  :slots (_msgID _date _time _teamID _shapeColor _shape _checksum ))

(defmethod heartbeat::detectDeliver
  (:init
   (&key
    ((:msgID __msgID) "")
    ((:date __date) "")
    ((:time __time) "")
    ((:teamID __teamID) "")
    ((:shapeColor __shapeColor) "")
    ((:shape __shape) "")
    ((:checksum __checksum) 0)
    )
   (send-super :init)
   (setq _msgID (string __msgID))
   (setq _date (string __date))
   (setq _time (string __time))
   (setq _teamID (string __teamID))
   (setq _shapeColor (string __shapeColor))
   (setq _shape (string __shape))
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
  (:shapeColor
   (&optional __shapeColor)
   (if __shapeColor (setq _shapeColor __shapeColor)) _shapeColor)
  (:shape
   (&optional __shape)
   (if __shape (setq _shape __shape)) _shape)
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
    ;; string _shapeColor
    4 (length _shapeColor)
    ;; string _shape
    4 (length _shape)
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
     ;; string _shapeColor
       (write-long (length _shapeColor) s) (princ _shapeColor s)
     ;; string _shape
       (write-long (length _shape) s) (princ _shape s)
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
   ;; string _shapeColor
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _shapeColor (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _shape
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _shape (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _checksum
     (setq _checksum (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get heartbeat::detectDeliver :md5sum-) "ce0c58613dee387ebf511525a16db3e0")
(setf (get heartbeat::detectDeliver :datatype-) "heartbeat/detectDeliver")
(setf (get heartbeat::detectDeliver :definition-)
      "string msgID
string date
string time
string teamID
string shapeColor
string shape
int32 checksum
")



(provide :heartbeat/detectDeliver "ce0c58613dee387ebf511525a16db3e0")


