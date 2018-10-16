;; Auto-generated. Do not edit!


(when (boundp 'camera1394::GetCameraRegisters)
  (if (not (find-package "CAMERA1394"))
    (make-package "CAMERA1394"))
  (shadow 'GetCameraRegisters (find-package "CAMERA1394")))
(unless (find-package "CAMERA1394::GETCAMERAREGISTERS")
  (make-package "CAMERA1394::GETCAMERAREGISTERS"))
(unless (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST")
  (make-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(unless (find-package "CAMERA1394::GETCAMERAREGISTERSRESPONSE")
  (make-package "CAMERA1394::GETCAMERAREGISTERSRESPONSE"))

(in-package "ROS")





(intern "*TYPE_CONTROL*" (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_CONTROL* (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::GetCameraRegistersRequest::*TYPE_CONTROL* 0)
(intern "*TYPE_ABSOLUTE*" (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_ABSOLUTE* (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::GetCameraRegistersRequest::*TYPE_ABSOLUTE* 1)
(intern "*TYPE_FORMAT7*" (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_FORMAT7* (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::GetCameraRegistersRequest::*TYPE_FORMAT7* 2)
(intern "*TYPE_ADVANCED_CONTROL*" (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_ADVANCED_CONTROL* (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::GetCameraRegistersRequest::*TYPE_ADVANCED_CONTROL* 3)
(intern "*TYPE_PIO*" (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_PIO* (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::GetCameraRegistersRequest::*TYPE_PIO* 4)
(intern "*TYPE_SIO*" (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_SIO* (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::GetCameraRegistersRequest::*TYPE_SIO* 5)
(intern "*TYPE_STROBE*" (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(shadow '*TYPE_STROBE* (find-package "CAMERA1394::GETCAMERAREGISTERSREQUEST"))
(defconstant camera1394::GetCameraRegistersRequest::*TYPE_STROBE* 6)
(defclass camera1394::GetCameraRegistersRequest
  :super ros::object
  :slots (_type _offset _num_regs _mode ))

(defmethod camera1394::GetCameraRegistersRequest
  (:init
   (&key
    ((:type __type) 0)
    ((:offset __offset) 0)
    ((:num_regs __num_regs) 0)
    ((:mode __mode) 0)
    )
   (send-super :init)
   (setq _type (round __type))
   (setq _offset (round __offset))
   (setq _num_regs (round __num_regs))
   (setq _mode (round __mode))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:offset
   (&optional __offset)
   (if __offset (setq _offset __offset)) _offset)
  (:num_regs
   (&optional __num_regs)
   (if __num_regs (setq _num_regs __num_regs)) _num_regs)
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
    ;; uint32 _num_regs
    4
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
     ;; uint32 _num_regs
       (write-long _num_regs s)
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
   ;; uint32 _num_regs
     (setq _num_regs (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _mode
     (setq _mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass camera1394::GetCameraRegistersResponse
  :super ros::object
  :slots (_value ))

(defmethod camera1394::GetCameraRegistersResponse
  (:init
   (&key
    ((:value __value) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _value __value)
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; uint32[] _value
    (* 4    (length _value)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32[] _value
     (write-long (length _value) s)
     (dotimes (i (length _value))
       (write-long (elt _value i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32[] _value
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _value (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _value i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass camera1394::GetCameraRegisters
  :super ros::object
  :slots ())

(setf (get camera1394::GetCameraRegisters :md5sum-) "9597d397bc64c4c4fcaf24bbb15f0256")
(setf (get camera1394::GetCameraRegisters :datatype-) "camera1394/GetCameraRegisters")
(setf (get camera1394::GetCameraRegisters :request) camera1394::GetCameraRegistersRequest)
(setf (get camera1394::GetCameraRegisters :response) camera1394::GetCameraRegistersResponse)

(defmethod camera1394::GetCameraRegistersRequest
  (:response () (instance camera1394::GetCameraRegistersResponse :init)))

(setf (get camera1394::GetCameraRegistersRequest :md5sum-) "9597d397bc64c4c4fcaf24bbb15f0256")
(setf (get camera1394::GetCameraRegistersRequest :datatype-) "camera1394/GetCameraRegistersRequest")
(setf (get camera1394::GetCameraRegistersRequest :definition-)
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

uint32 num_regs

uint32 mode
---

uint32[] value

")

(setf (get camera1394::GetCameraRegistersResponse :md5sum-) "9597d397bc64c4c4fcaf24bbb15f0256")
(setf (get camera1394::GetCameraRegistersResponse :datatype-) "camera1394/GetCameraRegistersResponse")
(setf (get camera1394::GetCameraRegistersResponse :definition-)
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

uint32 num_regs

uint32 mode
---

uint32[] value

")



(provide :camera1394/GetCameraRegisters "9597d397bc64c4c4fcaf24bbb15f0256")


