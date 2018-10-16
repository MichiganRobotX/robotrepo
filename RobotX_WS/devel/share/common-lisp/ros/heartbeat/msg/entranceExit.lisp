; Auto-generated. Do not edit!


(cl:in-package heartbeat-msg)


;//! \htmlinclude entranceExit.msg.html

(cl:defclass <entranceExit> (roslisp-msg-protocol:ros-message)
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
   (entrGate
    :reader entrGate
    :initarg :entrGate
    :type cl:integer
    :initform 0)
   (exitGate
    :reader exitGate
    :initarg :exitGate
    :type cl:integer
    :initform 0)
   (buoyActive
    :reader buoyActive
    :initarg :buoyActive
    :type cl:string
    :initform "")
   (lightPat
    :reader lightPat
    :initarg :lightPat
    :type cl:string
    :initform "")
   (checksum
    :reader checksum
    :initarg :checksum
    :type cl:integer
    :initform 0))
)

(cl:defclass entranceExit (<entranceExit>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <entranceExit>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'entranceExit)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name heartbeat-msg:<entranceExit> is deprecated: use heartbeat-msg:entranceExit instead.")))

(cl:ensure-generic-function 'msgID-val :lambda-list '(m))
(cl:defmethod msgID-val ((m <entranceExit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:msgID-val is deprecated.  Use heartbeat-msg:msgID instead.")
  (msgID m))

(cl:ensure-generic-function 'date-val :lambda-list '(m))
(cl:defmethod date-val ((m <entranceExit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:date-val is deprecated.  Use heartbeat-msg:date instead.")
  (date m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <entranceExit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:time-val is deprecated.  Use heartbeat-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'teamID-val :lambda-list '(m))
(cl:defmethod teamID-val ((m <entranceExit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:teamID-val is deprecated.  Use heartbeat-msg:teamID instead.")
  (teamID m))

(cl:ensure-generic-function 'entrGate-val :lambda-list '(m))
(cl:defmethod entrGate-val ((m <entranceExit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:entrGate-val is deprecated.  Use heartbeat-msg:entrGate instead.")
  (entrGate m))

(cl:ensure-generic-function 'exitGate-val :lambda-list '(m))
(cl:defmethod exitGate-val ((m <entranceExit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:exitGate-val is deprecated.  Use heartbeat-msg:exitGate instead.")
  (exitGate m))

(cl:ensure-generic-function 'buoyActive-val :lambda-list '(m))
(cl:defmethod buoyActive-val ((m <entranceExit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:buoyActive-val is deprecated.  Use heartbeat-msg:buoyActive instead.")
  (buoyActive m))

(cl:ensure-generic-function 'lightPat-val :lambda-list '(m))
(cl:defmethod lightPat-val ((m <entranceExit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:lightPat-val is deprecated.  Use heartbeat-msg:lightPat instead.")
  (lightPat m))

(cl:ensure-generic-function 'checksum-val :lambda-list '(m))
(cl:defmethod checksum-val ((m <entranceExit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:checksum-val is deprecated.  Use heartbeat-msg:checksum instead.")
  (checksum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <entranceExit>) ostream)
  "Serializes a message object of type '<entranceExit>"
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
  (cl:let* ((signed (cl:slot-value msg 'entrGate)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'exitGate)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'buoyActive))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'buoyActive))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'lightPat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'lightPat))
  (cl:let* ((signed (cl:slot-value msg 'checksum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <entranceExit>) istream)
  "Deserializes a message object of type '<entranceExit>"
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'entrGate) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'exitGate) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'buoyActive) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'buoyActive) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lightPat) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'lightPat) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'checksum) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<entranceExit>)))
  "Returns string type for a message object of type '<entranceExit>"
  "heartbeat/entranceExit")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'entranceExit)))
  "Returns string type for a message object of type 'entranceExit"
  "heartbeat/entranceExit")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<entranceExit>)))
  "Returns md5sum for a message object of type '<entranceExit>"
  "fee52aea8394473a9a7f6073941038c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'entranceExit)))
  "Returns md5sum for a message object of type 'entranceExit"
  "fee52aea8394473a9a7f6073941038c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<entranceExit>)))
  "Returns full string definition for message of type '<entranceExit>"
  (cl:format cl:nil "string msgID~%string date~%string time~%string teamID~%int32 entrGate~%int32 exitGate~%string buoyActive~%string lightPat~%int32 checksum~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'entranceExit)))
  "Returns full string definition for message of type 'entranceExit"
  (cl:format cl:nil "string msgID~%string date~%string time~%string teamID~%int32 entrGate~%int32 exitGate~%string buoyActive~%string lightPat~%int32 checksum~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <entranceExit>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'msgID))
     4 (cl:length (cl:slot-value msg 'date))
     4 (cl:length (cl:slot-value msg 'time))
     4 (cl:length (cl:slot-value msg 'teamID))
     4
     4
     4 (cl:length (cl:slot-value msg 'buoyActive))
     4 (cl:length (cl:slot-value msg 'lightPat))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <entranceExit>))
  "Converts a ROS message object to a list"
  (cl:list 'entranceExit
    (cl:cons ':msgID (msgID msg))
    (cl:cons ':date (date msg))
    (cl:cons ':time (time msg))
    (cl:cons ':teamID (teamID msg))
    (cl:cons ':entrGate (entrGate msg))
    (cl:cons ':exitGate (exitGate msg))
    (cl:cons ':buoyActive (buoyActive msg))
    (cl:cons ':lightPat (lightPat msg))
    (cl:cons ':checksum (checksum msg))
))
