(in-package #:steam-audio)

(defun make-source ()
  (c-let ((s (:struct steam-audio/raw::iplsource) :alloc t))
    ;;
    (setf (s :distanceattenuationmodel :type) :ipl_distanceattenuation_default
          (s :distanceattenuationmodel :mindistance) 1f0
          (s :distanceattenuationmodel :callback) (cffi:null-pointer)
          (s :distanceattenuationmodel :userdata) (cffi:null-pointer)
          (s :distanceattenuationmodel :dirty) :ipl_false)
    ;;
    (setf (s :airabsorptionmodel :type) :ipl_airabsorption_default
          (s :airabsorptionmodel :coefficients 0) 1f0
          (s :airabsorptionmodel :coefficients 1) 1f0
          (s :airabsorptionmodel :coefficients 0) 1f0
          (s :airabsorptionmodel :callback) (cffi:null-pointer)
          (s :airabsorptionmodel :userdata) (cffi:null-pointer)
          (s :airabsorptionmodel :dirty) :ipl_false)
    ;;
    (setf (s :directivity :dipoleweight) 0.5
          (s :directivity :dipolepower)  1f0
          (s :directivity :callback)     (cffi:null-pointer)
          (s :directivity :userdata)     (cffi:null-pointer))
    ;;
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
