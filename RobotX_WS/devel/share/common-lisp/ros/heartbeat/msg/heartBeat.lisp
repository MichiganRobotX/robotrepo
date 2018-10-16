; Auto-generated. Do not edit!


(cl:in-package heartbeat-msg)


;//! \htmlinclude heartBeat.msg.html

(cl:defclass <heartBeat> (roslisp-msg-protocol:ros-message)
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
   (latitude
    :reader latitude
    :initarg :latitude
    :type cl:float
    :initform 0.0)
   (longitude
    :reader longitude
    :initarg :longitude
    :type cl:float
    :initform 0.0)
   (NS
    :reader NS
    :initarg :NS
    :type cl:string
    :initform "")
   (EW
    :reader EW
    :initarg :EW
    :type cl:string
    :initform "")
   (teamID
    :reader teamID
    :initarg :teamID
    :type cl:string
    :initform "")
   (sysMode
    :reader sysMode
    :initarg :sysMode
    :type cl:integer
    :initform 0)
   (AUVStatus
    :reader AUVStatus
    :initarg :AUVStatus
    :type cl:integer
    :initform 0)
   (checksum
    :reader checksum
    :initarg :checksum
    :type cl:integer
    :initform 0))
)

(cl:defclass heartBeat (<heartBeat>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <heartBeat>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'heartBeat)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name heartbeat-msg:<heartBeat> is deprecated: use heartbeat-msg:heartBeat instead.")))

(cl:ensure-generic-function 'msgID-val :lambda-list '(m))
(cl:defmethod msgID-val ((m <heartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:msgID-val is deprecated.  Use heartbeat-msg:msgID instead.")
  (msgID m))

(cl:ensure-generic-function 'date-val :lambda-list '(m))
(cl:defmethod date-val ((m <heartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:date-val is deprecated.  Use heartbeat-msg:date instead.")
  (date m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <heartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:time-val is deprecated.  Use heartbeat-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'latitude-val :lambda-list '(m))
(cl:defmethod latitude-val ((m <heartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:latitude-val is deprecated.  Use heartbeat-msg:latitude instead.")
  (latitude m))

(cl:ensure-generic-function 'longitude-val :lambda-list '(m))
(cl:defmethod longitude-val ((m <heartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:longitude-val is deprecated.  Use heartbeat-msg:longitude instead.")
  (longitude m))

(cl:ensure-generic-function 'NS-val :lambda-list '(m))
(cl:defmethod NS-val ((m <heartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:NS-val is deprecated.  Use heartbeat-msg:NS instead.")
  (NS m))

(cl:ensure-generic-function 'EW-val :lambda-list '(m))
(cl:defmethod EW-val ((m <heartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:EW-val is deprecated.  Use heartbeat-msg:EW instead.")
  (EW m))

(cl:ensure-generic-function 'teamID-val :lambda-list '(m))
(cl:defmethod teamID-val ((m <heartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:teamID-val is deprecated.  Use heartbeat-msg:teamID instead.")
  (teamID m))

(cl:ensure-generic-function 'sysMode-val :lambda-list '(m))
(cl:defmethod sysMode-val ((m <heartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:sysMode-val is deprecated.  Use heartbeat-msg:sysMode instead.")
  (sysMode m))

(cl:ensure-generic-function 'AUVStatus-val :lambda-list '(m))
(cl:defmethod AUVStatus-val ((m <heartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:AUVStatus-val is deprecated.  Use heartbeat-msg:AUVStatus instead.")
  (AUVStatus m))

(cl:ensure-generic-function 'checksum-val :lambda-list '(m))
(cl:defmethod checksum-val ((m <heartBeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader heartbeat-msg:checksum-val is deprecated.  Use heartbeat-msg:checksum instead.")
  (checksum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <heartBeat>) ostream)
  "Serializes a message object of type '<heartBeat>"
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'NS))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'NS))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'EW))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'EW))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'teamID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'teamID))
  (cl:let* ((signed (cl:slot-value msg 'sysMode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'AUVStatus)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'checksum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <heartBeat>) istream)
  "Deserializes a message object of type '<heartBeat>"
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'NS) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'NS) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'EW) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'EW) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
      (cl:setf (cl:slot-value msg 'sysMode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'AUVStatus) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'checksum) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<heartBeat>)))
  "Returns string type for a message object of type '<heartBeat>"
  "heartbeat/heartBeat")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'heartBeat)))
  "Returns string type for a message object of type 'heartBeat"
  "heartbeat/heartBeat")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<heartBeat>)))
  "Returns md5sum for a message object of type '<heartBeat>"
  "9e916e349c3a6e892f5964e2d9636882")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'heartBeat)))
  "Returns md5sum for a message object of type 'heartBeat"
  "9e916e349c3a6e892f5964e2d9636882")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<heartBeat>)))
  "Returns full string definition for message of type '<heartBeat>"
  (cl:format cl:nil "string msgID~%string date~%string time~%float32 latitude~%float32 longitude~%string NS~%string EW~%string teamID~%int32 sysMode~%int32 AUVStatus~%int32 checksum~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'heartBeat)))
  "Returns full string definition for message of type 'heartBeat"
  (cl:format cl:nil "string msgID~%string date~%string time~%float32 latitude~%float32 longitude~%string NS~%string EW~%string teamID~%int32 sysMode~%int32 AUVStatus~%int32 checksum~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <heartBeat>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'msgID))
     4 (cl:length (cl:slot-value msg 'date))
     4 (cl:length (cl:slot-value msg 'time))
     4
     4
     4 (cl:length (cl:slot-value msg 'NS))
     4 (cl:length (cl:slot-value msg 'EW))
     4 (cl:length (cl:slot-value msg 'teamID))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <heartBeat>))
  "Converts a ROS message object to a list"
  (cl:list 'heartBeat
    (cl:cons ':msgID (msgID msg))
    (cl:cons ':date (date msg))
    (cl:cons ':time (time msg))
    (cl:cons ':latitude (latitude msg))
    (cl:cons ':longitude (longitude msg))
    (cl:cons ':NS (NS msg))
    (cl:cons ':EW (EW msg))
    (cl:cons ':teamID (teamID msg))
    (cl:cons ':sysMode (sysMode msg))
    (cl:cons ':AUVStatus (AUVStatus msg))
    (cl:cons ':checksum (checksum msg))
))
