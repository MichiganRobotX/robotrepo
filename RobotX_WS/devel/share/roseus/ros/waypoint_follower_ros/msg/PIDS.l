;; Auto-generated. Do not edit!


(when (boundp 'waypoint_follower_ros::PIDS)
  (if (not (find-package "WAYPOINT_FOLLOWER_ROS"))
    (make-package "WAYPOINT_FOLLOWER_ROS"))
  (shadow 'PIDS (find-package "WAYPOINT_FOLLOWER_ROS")))
(unless (find-package "WAYPOINT_FOLLOWER_ROS::PIDS")
  (make-package "WAYPOINT_FOLLOWER_ROS::PIDS"))

(in-package "ROS")
;;//! \htmlinclude PIDS.msg.html


(defclass waypoint_follower_ros::PIDS
  :super ros::object
  :slots (_lin_pos_P _lin_pos_I _lin_pos_D _lin_vel_P _lin_vel_I _lin_vel_D _angular_P _angular_I _angular_D ))

(defmethod waypoint_follower_ros::PIDS
  (:init
   (&key
    ((:lin_pos_P __lin_pos_P) 0.0)
    ((:lin_pos_I __lin_pos_I) 0.0)
    ((:lin_pos_D __lin_pos_D) 0.0)
    ((:lin_vel_P __lin_vel_P) 0.0)
    ((:lin_vel_I __lin_vel_I) 0.0)
    ((:lin_vel_D __lin_vel_D) 0.0)
    ((:angular_P __angular_P) 0.0)
    ((:angular_I __angular_I) 0.0)
    ((:angular_D __angular_D) 0.0)
    )
   (send-super :init)
   (setq _lin_pos_P (float __lin_pos_P))
   (setq _lin_pos_I (float __lin_pos_I))
   (setq _lin_pos_D (float __lin_pos_D))
   (setq _lin_vel_P (float __lin_vel_P))
   (setq _lin_vel_I (float __lin_vel_I))
   (setq _lin_vel_D (float __lin_vel_D))
   (setq _angular_P (float __angular_P))
   (setq _angular_I (float __angular_I))
   (setq _angular_D (float __angular_D))
   self)
  (:lin_pos_P
   (&optional __lin_pos_P)
   (if __lin_pos_P (setq _lin_pos_P __lin_pos_P)) _lin_pos_P)
  (:lin_pos_I
   (&optional __lin_pos_I)
   (if __lin_pos_I (setq _lin_pos_I __lin_pos_I)) _lin_pos_I)
  (:lin_pos_D
   (&optional __lin_pos_D)
   (if __lin_pos_D (setq _lin_pos_D __lin_pos_D)) _lin_pos_D)
  (:lin_vel_P
   (&optional __lin_vel_P)
   (if __lin_vel_P (setq _lin_vel_P __lin_vel_P)) _lin_vel_P)
  (:lin_vel_I
   (&optional __lin_vel_I)
   (if __lin_vel_I (setq _lin_vel_I __lin_vel_I)) _lin_vel_I)
  (:lin_vel_D
   (&optional __lin_vel_D)
   (if __lin_vel_D (setq _lin_vel_D __lin_vel_D)) _lin_vel_D)
  (:angular_P
   (&optional __angular_P)
   (if __angular_P (setq _angular_P __angular_P)) _angular_P)
  (:angular_I
   (&optional __angular_I)
   (if __angular_I (setq _angular_I __angular_I)) _angular_I)
  (:angular_D
   (&optional __angular_D)
   (if __angular_D (setq _angular_D __angular_D)) _angular_D)
  (:serialization-length
   ()
   (+
    ;; float64 _lin_pos_P
    8
    ;; float64 _lin_pos_I
    8
    ;; float64 _lin_pos_D
    8
    ;; float64 _lin_vel_P
    8
    ;; float64 _lin_vel_I
    8
    ;; float64 _lin_vel_D
    8
    ;; float64 _angular_P
    8
    ;; float64 _angular_I
    8
    ;; float64 _angular_D
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _lin_pos_P
       (sys::poke _lin_pos_P (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lin_pos_I
       (sys::poke _lin_pos_I (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lin_pos_D
       (sys::poke _lin_pos_D (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lin_vel_P
       (sys::poke _lin_vel_P (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lin_vel_I
       (sys::poke _lin_vel_I (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lin_vel_D
       (sys::poke _lin_vel_D (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angular_P
       (sys::poke _angular_P (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angular_I
       (sys::poke _angular_I (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angular_D
       (sys::poke _angular_D (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _lin_pos_P
     (setq _lin_pos_P (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lin_pos_I
     (setq _lin_pos_I (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lin_pos_D
     (setq _lin_pos_D (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lin_vel_P
     (setq _lin_vel_P (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lin_vel_I
     (setq _lin_vel_I (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lin_vel_D
     (setq _lin_vel_D (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angular_P
     (setq _angular_P (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angular_I
     (setq _angular_I (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angular_D
     (setq _angular_D (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get waypoint_follower_ros::PIDS :md5sum-) "a4a02a0cfead8995261060fd7d683381")
(setf (get waypoint_follower_ros::PIDS :datatype-) "waypoint_follower_ros/PIDS")
(setf (get waypoint_follower_ros::PIDS :definition-)
      "# PIDS message
float64 lin_pos_P
float64 lin_pos_I
float64 lin_pos_D

float64 lin_vel_P
float64 lin_vel_I
float64 lin_vel_D

float64 angular_P
float64 angular_I
float64 angular_D

")



(provide :waypoint_follower_ros/PIDS "a4a02a0cfead8995261060fd7d683381")


