;; Auto-generated. Do not edit!


(when (boundp 'waypoint_follower_ros::PID)
  (if (not (find-package "WAYPOINT_FOLLOWER_ROS"))
    (make-package "WAYPOINT_FOLLOWER_ROS"))
  (shadow 'PID (find-package "WAYPOINT_FOLLOWER_ROS")))
(unless (find-package "WAYPOINT_FOLLOWER_ROS::PID")
  (make-package "WAYPOINT_FOLLOWER_ROS::PID"))

(in-package "ROS")
;;//! \htmlinclude PID.msg.html


(defclass waypoint_follower_ros::PID
  :super ros::object
  :slots (_p _i _d ))

(defmethod waypoint_follower_ros::PID
  (:init
   (&key
    ((:p __p) 0.0)
    ((:i __i) 0.0)
    ((:d __d) 0.0)
    )
   (send-super :init)
   (setq _p (float __p))
   (setq _i (float __i))
   (setq _d (float __d))
   self)
  (:p
   (&optional __p)
   (if __p (setq _p __p)) _p)
  (:i
   (&optional __i)
   (if __i (setq _i __i)) _i)
  (:d
   (&optional __d)
   (if __d (setq _d __d)) _d)
  (:serialization-length
   ()
   (+
    ;; float64 _p
    8
    ;; float64 _i
    8
    ;; float64 _d
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _p
       (sys::poke _p (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _i
       (sys::poke _i (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _d
       (sys::poke _d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _p
     (setq _p (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _i
     (setq _i (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _d
     (setq _d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get waypoint_follower_ros::PID :md5sum-) "4d7f5db5580abe953fdf6985b0b4717c")
(setf (get waypoint_follower_ros::PID :datatype-) "waypoint_follower_ros/PID")
(setf (get waypoint_follower_ros::PID :definition-)
      "# PID message
float64 p
float64 i
float64 d

")



(provide :waypoint_follower_ros/PID "4d7f5db5580abe953fdf6985b0b4717c")


