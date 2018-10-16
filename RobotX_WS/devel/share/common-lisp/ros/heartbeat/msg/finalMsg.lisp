; Auto-generated. Do not edit!


(cl:in-package heartbeat-msg)


;//! \htmlinclude finalMsg.msg.html

(cl:defclass <finalMsg> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass finalMsg (<finalMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <finalMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'finalMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name heartbeat-msg:<finalMsg> is deprecated: use heartbeat-msg:finalMsg instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <finalMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:message-val is deprecated.  Use heartbeat-msg:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <finalMsg>) ostream)
  "Serializes a message object of type '<finalMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <finalMsg>) istream)
  "Deserializes a message object of type '<finalMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<finalMsg>)))
  "Returns string type for a message object of type '<finalMsg>"
  "heartbeat/finalMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'finalMsg)))
  "Returns string type for a message object of type 'finalMsg"
  "heartbeat/finalMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<finalMsg>)))
  "Returns md5sum for a message object of type '<finalMsg>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'finalMsg)))
  "Returns md5sum for a message object of type 'finalMsg"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<finalMsg>)))
  "Returns full string definition for message of type '<finalMsg>"
  (cl:format cl:nil "string message~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'finalMsg)))
  "Returns full string definition for message of type 'finalMsg"
  (cl:format cl:nil "string message~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <finalMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <finalMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'finalMsg
    (cl:cons ':message (message msg))
))
