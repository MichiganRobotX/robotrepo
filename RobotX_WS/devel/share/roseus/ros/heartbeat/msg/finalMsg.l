;; Auto-generated. Do not edit!


(when (boundp 'heartbeat::finalMsg)
  (if (not (find-package "HEARTBEAT"))
    (make-package "HEARTBEAT"))
  (shadow 'finalMsg (find-package "HEARTBEAT")))
(unless (find-package "HEARTBEAT::FINALMSG")
  (make-package "HEARTBEAT::FINALMSG"))

(in-package "ROS")
;;//! \htmlinclude finalMsg.msg.html


(defclass heartbeat::finalMsg
  :super ros::object
  :slots (_message ))

(defmethod heartbeat::finalMsg
  (:init
   (&key
    ((:message __message) "")
    )
   (send-super :init)
   (setq _message (string __message))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get heartbeat::finalMsg :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get heartbeat::finalMsg :datatype-) "heartbeat/finalMsg")
(setf (get heartbeat::finalMsg :definition-)
      "string message
")



(provide :heartbeat/finalMsg "5f003d6bcc824cbd51361d66d8e4f76c")


