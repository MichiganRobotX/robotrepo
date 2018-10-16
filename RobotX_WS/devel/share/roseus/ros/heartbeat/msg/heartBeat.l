;; Auto-generated. Do not edit!


(when (boundp 'heartbeat::heartBeat)
  (if (not (find-package "HEARTBEAT"))
    (make-package "HEARTBEAT"))
  (shadow 'heartBeat (find-package "HEARTBEAT")))
(unless (find-package "HEARTBEAT::HEARTBEAT")
  (make-package "HEARTBEAT::HEARTBEAT"))

(in-package "ROS")
;;//! \htmlinclude heartBeat.msg.html


(defclass heartbeat::heartBeat
  :super ros::object
  :slots (_msgID _date _time _latitude _longitude _NS _EW _teamID _sysMode _AUVStatus _checksum ))

(defmethod heartbeat::heartBeat
  (:init
   (&key
    ((:msgID __msgID) "")
    ((:date __date) "")
    ((:time __time) "")
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:NS __NS) "")
    ((:EW __EW) "")
    ((:teamID __teamID) "")
    ((:sysMode __sysMode) 0)
    ((:AUVStatus __AUVStatus) 0)
    ((:checksum __checksum) 0)
    )
   (send-super :init)
   (setq _msgID (string __msgID))
   (setq _date (string __date))
   (setq _time (string __time))
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _NS (string __NS))
   (setq _EW (string __EW))
   (setq _teamID (string __teamID))
   (setq _sysMode (round __sysMode))
   (setq _AUVStatus (round __AUVStatus))
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
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:NS
   (&optional __NS)
   (if __NS (setq _NS __NS)) _NS)
  (:EW
   (&optional __EW)
   (if __EW (setq _EW __EW)) _EW)
  (:teamID
   (&optional __teamID)
   (if __teamID (setq _teamID __teamID)) _teamID)
  (:sysMode
   (&optional __sysMode)
   (if __sysMode (setq _sysMode __sysMode)) _sysMode)
  (:AUVStatus
   (&optional __AUVStatus)
   (if __AUVStatus (setq _AUVStatus __AUVStatus)) _AUVStatus)
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
    ;; float32 _latitude
    4
    ;; float32 _longitude
    4
    ;; string _NS
    4 (length _NS)
    ;; string _EW
    4 (length _EW)
    ;; string _teamID
    4 (length _teamID)
    ;; int32 _sysMode
    4
    ;; int32 _AUVStatus
    4
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
     ;; float32 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _NS
       (write-long (length _NS) s) (princ _NS s)
     ;; string _EW
       (write-long (length _EW) s) (princ _EW s)
     ;; string _teamID
       (write-long (length _teamID) s) (princ _teamID s)
     ;; int32 _sysMode
       (write-long _sysMode s)
     ;; int32 _AUVStatus
       (write-long _AUVStatus s)
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
   ;; float32 _latitude
     (setq _latitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _longitude
     (setq _longitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _NS
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _NS (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _EW
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _EW (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _teamID
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _teamID (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _sysMode
     (setq _sysMode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _AUVStatus
     (setq _AUVStatus (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _checksum
     (setq _checksum (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get heartbeat::heartBeat :md5sum-) "9e916e349c3a6e892f5964e2d9636882")
(setf (get heartbeat::heartBeat :datatype-) "heartbeat/heartBeat")
(setf (get heartbeat::heartBeat :definition-)
      "string msgID
string date
string time
float32 latitude
float32 longitude
string NS
string EW
string teamID
int32 sysMode
int32 AUVStatus
int32 checksum
")



(provide :heartbeat/heartBeat "9e916e349c3a6e892f5964e2d9636882")


