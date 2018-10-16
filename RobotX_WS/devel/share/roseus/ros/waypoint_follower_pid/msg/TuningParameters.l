;; Auto-generated. Do not edit!


(when (boundp 'waypoint_follower_pid::TuningParameters)
  (if (not (find-package "WAYPOINT_FOLLOWER_PID"))
    (make-package "WAYPOINT_FOLLOWER_PID"))
  (shadow 'TuningParameters (find-package "WAYPOINT_FOLLOWER_PID")))
(unless (find-package "WAYPOINT_FOLLOWER_PID::TUNINGPARAMETERS")
  (make-package "WAYPOINT_FOLLOWER_PID::TUNINGPARAMETERS"))

(in-package "ROS")
;;//! \htmlinclude TuningParameters.msg.html


(defclass waypoint_follower_pid::TuningParameters
  :super ros::object
  :slots (_out_x _out_v _err_v ))

(defmethod waypoint_follower_pid::TuningParameters
  (:init
   (&key
    ((:out_x __out_x) 0.0)
    ((:out_v __out_v) 0.0)
    ((:err_v __err_v) 0.0)
    )
   (send-super :init)
   (setq _out_x (float __out_x))
   (setq _out_v (float __out_v))
   (setq _err_v (float __err_v))
   self)
  (:out_x
   (&optional __out_x)
   (if __out_x (setq _out_x __out_x)) _out_x)
  (:out_v
   (&optional __out_v)
   (if __out_v (setq _out_v __out_v)) _out_v)
  (:err_v
   (&optional __err_v)
   (if __err_v (setq _err_v __err_v)) _err_v)
  (:serialization-length
   ()
   (+
    ;; float32 _out_x
    4
    ;; float32 _out_v
    4
    ;; float32 _err_v
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _out_x
       (sys::poke _out_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _out_v
       (sys::poke _out_v (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _err_v
       (sys::poke _err_v (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _out_x
     (setq _out_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _out_v
     (setq _out_v (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _err_v
     (setq _err_v (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get waypoint_follower_pid::TuningParameters :md5sum-) "0980976f0bdca75f72b664cc976a51bc")
(setf (get waypoint_follower_pid::TuningParameters :datatype-) "waypoint_follower_pid/TuningParameters")
(setf (get waypoint_follower_pid::TuningParameters :definition-)
      "# Tuning message
float32 out_x
float32 out_v
float32 err_v

")



(provide :waypoint_follower_pid/TuningParameters "0980976f0bdca75f72b664cc976a51bc")


