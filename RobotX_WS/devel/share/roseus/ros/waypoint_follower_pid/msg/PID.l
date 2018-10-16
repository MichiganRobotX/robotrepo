;; Auto-generated. Do not edit!


(when (boundp 'waypoint_follower_pid::PID)
  (if (not (find-package "WAYPOINT_FOLLOWER_PID"))
    (make-package "WAYPOINT_FOLLOWER_PID"))
  (shadow 'PID (find-package "WAYPOINT_FOLLOWER_PID")))
(unless (find-package "WAYPOINT_FOLLOWER_PID::PID")
  (make-package "WAYPOINT_FOLLOWER_PID::PID"))

(in-package "ROS")
;;//! \htmlinclude PID.msg.html


(defclass waypoint_follower_pid::PID
  :super ros::object
  :slots (_p _i _d ))

(defmethod waypoint_follower_pid::PID
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
    ;; float32 _p
    4
    ;; float32 _i
    4
    ;; float32 _d
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _p
       (sys::poke _p (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _i
       (sys::poke _i (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _d
       (sys::poke _d (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _p
     (setq _p (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _i
     (setq _i (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _d
     (setq _d (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get waypoint_follower_pid::PID :md5sum-) "cccd09188ee638c943ed6be95f1812c9")
(setf (get waypoint_follower_pid::PID :datatype-) "waypoint_follower_pid/PID")
(setf (get waypoint_follower_pid::PID :definition-)
      "# PID message
float32 p
float32 i
float32 d

")



(provide :waypoint_follower_pid/PID "cccd09188ee638c943ed6be95f1812c9")


