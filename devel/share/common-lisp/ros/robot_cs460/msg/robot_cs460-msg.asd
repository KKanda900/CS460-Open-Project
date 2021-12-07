
(cl:in-package :asdf)

(defsystem "robot_cs460-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Drive" :depends-on ("_package_Drive"))
    (:file "_package_Drive" :depends-on ("_package"))
    (:file "Position" :depends-on ("_package_Position"))
    (:file "_package_Position" :depends-on ("_package"))
  ))