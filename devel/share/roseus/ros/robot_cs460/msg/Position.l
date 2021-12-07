;; Auto-generated. Do not edit!


(when (boundp 'robot_cs460::Position)
  (if (not (find-package "ROBOT_CS460"))
    (make-package "ROBOT_CS460"))
  (shadow 'Position (find-package "ROBOT_CS460")))
(unless (find-package "ROBOT_CS460::POSITION")
  (make-package "ROBOT_CS460::POSITION"))

(in-package "ROS")
;;//! \htmlinclude Position.msg.html


(defclass robot_cs460::Position
  :super ros::object
  :slots (_direction ))

(defmethod robot_cs460::Position
  (:init
   (&key
    ((:direction __direction) "")
    )
   (send-super :init)
   (setq _direction (string __direction))
   self)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:serialization-length
   ()
   (+
    ;; string _direction
    4 (length _direction)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _direction
       (write-long (length _direction) s) (princ _direction s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get robot_cs460::Position :md5sum-) "326e9417def5db9a05a2704a4d8de15e")
(setf (get robot_cs460::Position :datatype-) "robot_cs460/Position")
(setf (get robot_cs460::Position :definition-)
      "string direction

")



(provide :robot_cs460/Position "326e9417def5db9a05a2704a4d8de15e")


