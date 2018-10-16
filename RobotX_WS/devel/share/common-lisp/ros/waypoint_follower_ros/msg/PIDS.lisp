; Auto-generated. Do not edit!


(cl:in-package waypoint_follower_ros-msg)


;//! \htmlinclude PIDS.msg.html

(cl:defclass <PIDS> (roslisp-msg-protocol:ros-message)
  ((lin_pos_P
    :reader lin_pos_P
    :initarg :lin_pos_P
    :type cl:float
    :initform 0.0)
   (lin_pos_I
    :reader lin_pos_I
    :initarg :lin_pos_I
    :type cl:float
    :initform 0.0)
   (lin_pos_D
    :reader lin_pos_D
    :initarg :lin_pos_D
    :type cl:float
    :initform 0.0)
   (lin_vel_P
    :reader lin_vel_P
    :initarg :lin_vel_P
    :type cl:float
    :initform 0.0)
   (lin_vel_I
    :reader lin_vel_I
    :initarg :lin_vel_I
    :type cl:float
    :initform 0.0)
   (lin_vel_D
    :reader lin_vel_D
    :initarg :lin_vel_D
    :type cl:float
    :initform 0.0)
   (angular_P
    :reader angular_P
    :initarg :angular_P
    :type cl:float
    :initform 0.0)
   (angular_I
    :reader angular_I
    :initarg :angular_I
    :type cl:float
    :initform 0.0)
   (angular_D
    :reader angular_D
    :initarg :angular_D
    :type cl:float
    :initform 0.0))
)

(cl:defclass PIDS (<PIDS>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PIDS>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PIDS)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waypoint_follower_ros-msg:<PIDS> is deprecated: use waypoint_follower_ros-msg:PIDS instead.")))

(cl:ensure-generic-function 'lin_pos_P-val :lambda-list '(m))
(cl:defmethod lin_pos_P-val ((m <PIDS>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waypoint_follower_ros-msg:lin_pos_P-val is deprecated.  Use waypoint_follower_ros-msg:lin_pos_P instead.")
  (lin_pos_P m))

(cl:ensure-generic-function 'lin_pos_I-val :lambda-list '(m))
(cl:defmethod lin_pos_I-val ((m <PIDS>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waypoint_follower_ros-msg:lin_pos_I-val is deprecated.  Use waypoint_follower_ros-msg:lin_pos_I instead.")
  (lin_pos_I m))

(cl:ensure-generic-function 'lin_pos_D-val :lambda-list '(m))
(cl:defmethod lin_pos_D-val ((m <PIDS>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waypoint_follower_ros-msg:lin_pos_D-val is deprecated.  Use waypoint_follower_ros-msg:lin_pos_D instead.")
  (lin_pos_D m))

(cl:ensure-generic-function 'lin_vel_P-val :lambda-list '(m))
(cl:defmethod lin_vel_P-val ((m <PIDS>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waypoint_follower_ros-msg:lin_vel_P-val is deprecated.  Use waypoint_follower_ros-msg:lin_vel_P instead.")
  (lin_vel_P m))

(cl:ensure-generic-function 'lin_vel_I-val :lambda-list '(m))
(cl:defmethod lin_vel_I-val ((m <PIDS>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waypoint_follower_ros-msg:lin_vel_I-val is deprecated.  Use waypoint_follower_ros-msg:lin_vel_I instead.")
  (lin_vel_I m))

(cl:ensure-generic-function 'lin_vel_D-val :lambda-list '(m))
(cl:defmethod lin_vel_D-val ((m <PIDS>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waypoint_follower_ros-msg:lin_vel_D-val is deprecated.  Use waypoint_follower_ros-msg:lin_vel_D instead.")
  (lin_vel_D m))

(cl:ensure-generic-function 'angular_P-val :lambda-list '(m))
(cl:defmethod angular_P-val ((m <PIDS>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waypoint_follower_ros-msg:angular_P-val is deprecated.  Use waypoint_follower_ros-msg:angular_P instead.")
  (angular_P m))

(cl:ensure-generic-function 'angular_I-val :lambda-list '(m))
(cl:defmethod angular_I-val ((m <PIDS>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waypoint_follower_ros-msg:angular_I-val is deprecated.  Use waypoint_follower_ros-msg:angular_I instead.")
  (angular_I m))

(cl:ensure-generic-function 'angular_D-val :lambda-list '(m))
(cl:defmethod angular_D-val ((m <PIDS>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waypoint_follower_ros-msg:angular_D-val is deprecated.  Use waypoint_follower_ros-msg:angular_D instead.")
  (angular_D m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PIDS>) ostream)
  "Serializes a message object of type '<PIDS>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lin_pos_P))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lin_pos_I))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lin_pos_D))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lin_vel_P))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lin_vel_I))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lin_vel_D))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angular_P))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angular_I))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angular_D))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PIDS>) istream)
  "Deserializes a message object of type '<PIDS>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lin_pos_P) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lin_pos_I) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lin_pos_D) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lin_vel_P) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lin_vel_I) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lin_vel_D) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular_P) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular_I) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular_D) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PIDS>)))
  "Returns string type for a message object of type '<PIDS>"
  "waypoint_follower_ros/PIDS")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PIDS)))
  "Returns string type for a message object of type 'PIDS"
  "waypoint_follower_ros/PIDS")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PIDS>)))
  "Returns md5sum for a message object of type '<PIDS>"
  "a4a02a0cfead8995261060fd7d683381")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PIDS)))
  "Returns md5sum for a message object of type 'PIDS"
  "a4a02a0cfead8995261060fd7d683381")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PIDS>)))
  "Returns full string definition for message of type '<PIDS>"
  (cl:format cl:nil "# PIDS message~%float64 lin_pos_P~%float64 lin_pos_I~%float64 lin_pos_D~%~%float64 lin_vel_P~%float64 lin_vel_I~%float64 lin_vel_D~%~%float64 angular_P~%float64 angular_I~%float64 angular_D~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PIDS)))
  "Returns full string definition for message of type 'PIDS"
  (cl:format cl:nil "# PIDS message~%float64 lin_pos_P~%float64 lin_pos_I~%float64 lin_pos_D~%~%float64 lin_vel_P~%float64 lin_vel_I~%float64 lin_vel_D~%~%float64 angular_P~%float64 angular_I~%float64 angular_D~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PIDS>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PIDS>))
  "Converts a ROS message object to a list"
  (cl:list 'PIDS
    (cl:cons ':lin_pos_P (lin_pos_P msg))
    (cl:cons ':lin_pos_I (lin_pos_I msg))
    (cl:cons ':lin_pos_D (lin_pos_D msg))
    (cl:cons ':lin_vel_P (lin_vel_P msg))
    (cl:cons ':lin_vel_I (lin_vel_I msg))
    (cl:cons ':lin_vel_D (lin_vel_D msg))
    (cl:cons ':angular_P (angular_P msg))
    (cl:cons ':angular_I (angular_I msg))
    (cl:cons ':angular_D (angular_D msg))
))
