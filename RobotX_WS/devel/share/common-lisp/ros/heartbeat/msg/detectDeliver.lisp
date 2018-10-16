; Auto-generated. Do not edit!


(cl:in-package heartbeat-msg)


;//! \htmlinclude detectDeliver.msg.html

(cl:defclass <detectDeliver> (roslisp-msg-protocol:ros-message)
  ((msgID
    :reader msgID
    :initarg :msgID
    :type cl:string
    :initform "")
   (date
    :reader date
    :initarg :date
    :type cl:string
    :initform "")
   (time
    :reader time
    :initarg :time
    :type cl:string
    :initform "")
   (teamID
    :reader teamID
    :initarg :teamID
    :type cl:string
    :initform "")
   (shapeColor
    :reader shapeColor
    :initarg :shapeColor
    :type cl:string
    :initform "")
   (shape
    :reader shape
    :initarg :shape
    :type cl:string
    :initform "")
   (checksum
    :reader checksum
    :initarg :checksum
    :type cl:integer
    :initform 0))
)

(cl:defclass detectDeliver (<detectDeliver>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <detectDeliver>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'detectDeliver)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name heartbeat-msg:<detectDeliver> is deprecated: use heartbeat-msg:detectDeliver instead.")))

(cl:ensure-generic-function 'msgID-val :lambda-list '(m))
(cl:defmethod msgID-val ((m <detectDeliver>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:msgID-val is deprecated.  Use heartbeat-msg:msgID instead.")
  (msgID m))

(cl:ensure-generic-function 'date-val :lambda-list '(m))
(cl:defmethod date-val ((m <detectDeliver>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:date-val is deprecated.  Use heartbeat-msg:date instead.")
  (date m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <detectDeliver>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:time-val is deprecated.  Use heartbeat-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'teamID-val :lambda-list '(m))
(cl:defmethod teamID-val ((m <detectDeliver>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:teamID-val is deprecated.  Use heartbeat-msg:teamID instead.")
  (teamID m))

(cl:ensure-generic-function 'shapeColor-val :lambda-list '(m))
(cl:defmethod shapeColor-val ((m <detectDeliver>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:shapeColor-val is deprecated.  Use heartbeat-msg:shapeColor instead.")
  (shapeColor m))

(cl:ensure-generic-function 'shape-val :lambda-list '(m))
(cl:defmethod shape-val ((m <detectDeliver>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:shape-val is deprecated.  Use heartbeat-msg:shape instead.")
  (shape m))

(cl:ensure-generic-function 'checksum-val :lambda-list '(m))
(cl:defmethod checksum-val ((m <detectDeliver>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:checksum-val is deprecated.  Use heartbeat-msg:checksum instead.")
  (checksum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <detectDeliver>) ostream)
  "Serializes a message object of type '<detectDeliver>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msgID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msgID))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'date))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'date))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'time))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'teamID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'teamID))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'shapeColor))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'shapeColor))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'shape))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'shape))
  (cl:let* ((signed (cl:slot-value msg 'checksum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <detectDeliver>) istream)
  "Deserializes a message object of type '<detectDeliver>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msgID) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'msgID) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'date) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'date) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'time) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'teamID) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'teamID) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'shapeColor) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'shapeColor) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'shape) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'shape) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'checksum) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<detectDeliver>)))
  "Returns string type for a message object of type '<detectDeliver>"
  "heartbeat/detectDeliver")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'detectDeliver)))
  "Returns string type for a message object of type 'detectDeliver"
  "heartbeat/detectDeliver")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<detectDeliver>)))
  "Returns md5sum for a message object of type '<detectDeliver>"
  "ce0c58613dee387ebf511525a16db3e0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'detectDeliver)))
  "Returns md5sum for a message object of type 'detectDeliver"
  "ce0c58613dee387ebf511525a16db3e0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<detectDeliver>)))
  "Returns full string definition for message of type '<detectDeliver>"
  (cl:format cl:nil "string msgID~%string date~%string time~%string teamID~%string shapeColor~%string shape~%int32 checksum~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'detectDeliver)))
  "Returns full string definition for message of type 'detectDeliver"
  (cl:format cl:nil "string msgID~%string date~%string time~%string teamID~%string shapeColor~%string shape~%int32 checksum~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <detectDeliver>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'msgID))
     4 (cl:length (cl:slot-value msg 'date))
     4 (cl:length (cl:slot-value msg 'time))
     4 (cl:length (cl:slot-value msg 'teamID))
     4 (cl:length (cl:slot-value msg 'shapeColor))
     4 (cl:length (cl:slot-value msg 'shape))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <detectDeliver>))
  "Converts a ROS message object to a list"
  (cl:list 'detectDeliver
    (cl:cons ':msgID (msgID msg))
    (cl:cons ':date (date msg))
    (cl:cons ':time (time msg))
    (cl:cons ':teamID (teamID msg))
    (cl:cons ':shapeColor (shapeColor msg))
    (cl:cons ':shape (shape msg))
    (cl:cons ':checksum (checksum msg))
))
