;; Auto-generated. Do not edit!


(when (boundp 'camera1394::SetCameraRegisters)
  (if (not (find-package "CAMERA1394"))
    (make-package "CAMERA1394"))
  (shadow 'SetCameraRegisters (find-package "CAMERA1394")))
(unless (find-package "CAMERA1394::SETCAMERAREGISTERS")
  (make-package "CAMERA1394::SETCAMERAREGISTERS"))
(unless (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST")
  (make-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(unless (find-package "CAMERA1394::SETCAMERAREGISTERSRESPONSE")
  (make-package "CAMERA1394::SETCAMERAREGISTERSRESPONSE"))

(in-package "ROS")





(intern "*TYPE_CONTROL*" (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_CONTROL* (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::SetCameraRegistersRequest::*TYPE_CONTROL* 0)
(intern "*TYPE_ABSOLUTE*" (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_ABSOLUTE* (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::SetCameraRegistersRequest::*TYPE_ABSOLUTE* 1)
(intern "*TYPE_FORMAT7*" (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_FORMAT7* (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::SetCameraRegistersRequest::*TYPE_FORMAT7* 2)
(intern "*TYPE_ADVANCED_CONTROL*" (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_ADVANCED_CONTROL* (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::SetCameraRegistersRequest::*TYPE_ADVANCED_CONTROL* 3)
(intern "*TYPE_PIO*" (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_PIO* (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::SetCameraRegistersRequest::*TYPE_PIO* 4)
(intern "*TYPE_SIO*" (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_SIO* (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::SetCameraRegistersRequest::*TYPE_SIO* 5)
(intern "*TYPE_STROBE*" (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_STROBE* (find-package "CAMERA1394::SETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::SetCameraRegistersRequest::*TYPE_STROBE* 6)
(defclass camera1394::SetCameraRegistersRequest
  :super ros::object
  :slots (_type _offset _value _mode ))

(defmethod camera1394::SetCameraRegistersRequest
  (:init
   (&key
    ((:type __type) 0)
    ((:offset __offset) 0)
    ((:value __value) (make-array 0 :initial-element 0 :element-type :integer))
    ((:mode __mode) 0)
    )
   (send-super :init)
   (setq _type (round __type))
   (setq _offset (round __offset))
   (setq _value __value)
   (setq _mode (round __mode))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:offset
   (&optional __offset)
   (if __offset (setq _offset __offset)) _offset)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:serialization-length
   ()
   (+
    ;; uint8 _type
    1
    ;; uint64 _offset
    8
    ;; uint32[] _value
    (* 4    (length _value)) 4
    ;; uint32 _mode
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _type
       (write-byte _type s)
     ;; uint64 _offset
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _offset (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _offset) (= (length (_offset . bv)) 2)) ;; bignum
              (write-long (ash (elt (_offset . bv) 0) 0) s)
              (write-long (ash (elt (_offset . bv) 1) -1) s))
             ((and (class _offset) (= (length (_offset . bv)) 1)) ;; big1
              (write-long (elt (_offset . bv) 0) s)
              (write-long (if (>= _offset 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _offset s)(write-long (if (>= _offset 0) 0 #xffffffff) s)))
     ;; uint32[] _value
     (write-long (length _value) s)
     (dotimes (i (length _value))
       (write-long (elt _value i) s)
       )
     ;; uint32 _mode
       (write-long _mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint64 _offset
     
#+(or :alpha :irix6 :x86_64)
      (setf _offset (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _offset (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint32[] _value
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _value (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _value i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; uint32 _mode
     (setq _mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass camera1394::SetCameraRegistersResponse
  :super ros::object
  :slots ())

(defmethod camera1394::SetCameraRegistersResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass camera1394::SetCameraRegisters
  :super ros::object
  :slots ())

(setf (get camera1394::SetCameraRegisters :md5sum-) "703211788a5d6f08f820dfb1792ab51c")
(setf (get camera1394::SetCameraRegisters :datatype-) "camera1394/SetCameraRegisters")
(setf (get camera1394::SetCameraRegisters :request) camera1394::SetCameraRegistersRequest)
(setf (get camera1394::SetCameraRegisters :response) camera1394::SetCameraRegistersResponse)

(defmethod camera1394::SetCameraRegistersRequest
  (:response () (instance camera1394::SetCameraRegistersResponse :init)))

(setf (get camera1394::SetCameraRegistersRequest :md5sum-) "703211788a5d6f08f820dfb1792ab51c")
(setf (get camera1394::SetCameraRegistersRequest :datatype-) "camera1394/SetCameraRegistersRequest")
(setf (get camera1394::SetCameraRegistersRequest :definition-)
      "
uint8 TYPE_CONTROL=0
uint8 TYPE_ABSOLUTE=1
uint8 TYPE_FORMAT7=2
uint8 TYPE_ADVANCED_CONTROL=3
uint8 TYPE_PIO=4
uint8 TYPE_SIO=5
uint8 TYPE_STROBE=6

uint8 type

uint64 offset

uint32[] value

uint32 mode
---

")

(setf (get camera1394::SetCameraRegistersResponse :md5sum-) "703211788a5d6f08f820dfb1792ab51c")
(setf (get camera1394::SetCameraRegistersResponse :datatype-) "camera1394/SetCameraRegistersResponse")
(setf (get camera1394::SetCameraRegistersResponse :definition-)
      "
uint8 TYPE_CONTROL=0
uint8 TYPE_ABSOLUTE=1
uint8 TYPE_FORMAT7=2
uint8 TYPE_ADVANCED_CONTROL=3
uint8 TYPE_PIO=4
uint8 TYPE_SIO=5
uint8 TYPE_STROBE=6

uint8 type

uint64 offset

uint32[] value

uint32 mode
---

")



(provide :camera1394/SetCameraRegisters "703211788a5d6f08f820dfb1792ab51c")


