;; Auto-generated. Do not edit!


(when (boundp 'waypoint_follower_ros::TuningParameters)
  (if (not (find-package "WAYPOINT_FOLLOWER_ROS"))
    (make-package "WAYPOINT_FOLLOWER_ROS"))
  (shadow 'TuningParameters (find-package "WAYPOINT_FOLLOWER_ROS")))
(unless (find-package "WAYPOINT_FOLLOWER_ROS::TUNINGPARAMETERS")
  (make-package "WAYPOINT_FOLLOWER_ROS::TUNINGPARAMETERS"))

(in-package "ROS")
;;//! \htmlinclude TuningParameters.msg.html


(defclass waypoint_follower_ros::TuningParameters
  :super ros::object
  :slots (_out_x _out_v _err_v ))

(defmethod waypoint_follower_ros::TuningParameters
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
    ;; float64 _out_x
    8
    ;; float64 _out_v
    8
    ;; float64 _err_v
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _out_x
       (sys::poke _out_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _out_v
       (sys::poke _out_v (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _err_v
       (sys::poke _err_v (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _out_x
     (setq _out_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _out_v
     (setq _out_v (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _err_v
     (setq _err_v (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get waypoint_follower_ros::TuningParameters :md5sum-) "d61f6394ad651da55e4a97e6f01da528")
(setf (get waypoint_follower_ros::TuningParameters :datatype-) "waypoint_follower_ros/TuningParameters")
(setf (get waypoint_follower_ros::TuningParameters :definition-)
      "# Tuning message
float64 out_x
float64 out_v
float64 err_v

")



(provide :waypoint_follower_ros/TuningParameters "d61f6394ad651da55e4a97e6f01da528")


