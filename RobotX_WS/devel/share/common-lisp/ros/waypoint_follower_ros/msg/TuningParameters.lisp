; Auto-generated. Do not edit!


(cl:in-package waypoint_follower_ros-msg)


;//! \htmlinclude TuningParameters.msg.html

(cl:defclass <TuningParameters> (roslisp-msg-protocol:ros-message)
  ((out_x
    :reader out_x
    :initarg :out_x
    :type cl:float
    :initform 0.0)
   (out_v
    :reader out_v
    :initarg :out_v
    :type cl:float
    :initform 0.0)
   (err_v
    :reader err_v
    :initarg :err_v
    :type cl:float
    :initform 0.0))
)

(cl:defclass TuningParameters (<TuningParameters>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TuningParameters>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TuningParameters)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name waypoint_follower_ros-msg:<TuningParameters> is deprecated: use waypoint_follower_ros-msg:TuningParameters instead.")))

(cl:ensure-generic-function 'out_x-val :lambda-list '(m))
(cl:defmethod out_x-val ((m <TuningParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waypoint_follower_ros-msg:out_x-val is deprecated.  Use waypoint_follower_ros-msg:out_x instead.")
  (out_x m))

(cl:ensure-generic-function 'out_v-val :lambda-list '(m))
(cl:defmethod out_v-val ((m <TuningParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waypoint_follower_ros-msg:out_v-val is deprecated.  Use waypoint_follower_ros-msg:out_v instead.")
  (out_v m))

(cl:ensure-generic-function 'err_v-val :lambda-list '(m))
(cl:defmethod err_v-val ((m <TuningParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader waypoint_follower_ros-msg:err_v-val is deprecated.  Use waypoint_follower_ros-msg:err_v instead.")
  (err_v m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TuningParameters>) ostream)
  "Serializes a message object of type '<TuningParameters>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'out_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'out_v))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'err_v))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TuningParameters>) istream)
  "Deserializes a message object of type '<TuningParameters>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'out_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'out_v) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'err_v) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TuningParameters>)))
  "Returns string type for a message object of type '<TuningParameters>"
  "waypoint_follower_ros/TuningParameters")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TuningParameters)))
  "Returns string type for a message object of type 'TuningParameters"
  "waypoint_follower_ros/TuningParameters")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TuningParameters>)))
  "Returns md5sum for a message object of type '<TuningParameters>"
  "d61f6394ad651da55e4a97e6f01da528")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TuningParameters)))
  "Returns md5sum for a message object of type 'TuningParameters"
  "d61f6394ad651da55e4a97e6f01da528")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TuningParameters>)))
  "Returns full string definition for message of type '<TuningParameters>"
  (cl:format cl:nil "# Tuning message~%float64 out_x~%float64 out_v~%float64 err_v~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TuningParameters)))
  "Returns full string definition for message of type 'TuningParameters"
  (cl:format cl:nil "# Tuning message~%float64 out_x~%float64 out_v~%float64 err_v~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TuningParameters>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TuningParameters>))
  "Converts a ROS message object to a list"
  (cl:list 'TuningParameters
    (cl:cons ':out_x (out_x msg))
    (cl:cons ':out_v (out_v msg))
    (cl:cons ':err_v (err_v msg))
))
