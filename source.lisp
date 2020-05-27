(in-package #:steam-audio)

(defun make-source ()
  (c-let ((s (:struct source) :alloc t))
    (setf (s :directivity :dipoleweight) .5
          (s :directivity :dipolepower) 1f0
          (s :directivity :callback) (cffi:null-pointer)
          (s :directivity :userdata) (cffi:null-pointer))
    (setf (s :position :x) 0f0
          (s :position :y) 0f0
          (s :position :z) 0f0)
    (setf (s :ahead    :x) 0f0
          (s :ahead    :y) 0f0
          (s :ahead    :z) 0f0)
    (setf (s :up       :x) 0f0
          (s :up       :y) 1f0
          (s :up       :z) 0f0)
    (setf (s :right    :x) 0f0
          (s :right    :y) 0f0
          (s :right    :z) 1f0)
    (s &)))
