
(cl:in-package :asdf)

(defsystem "waypoint_follower_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PID" :depends-on ("_package_PID"))
    (:file "_package_PID" :depends-on ("_package"))
    (:file "PIDS" :depends-on ("_package_PIDS"))
    (:file "_package_PIDS" :depends-on ("_package"))
    (:file "TuningParameters" :depends-on ("_package_TuningParameters"))
    (:file "_package_TuningParameters" :depends-on ("_package"))
  ))