(in-package #:steam-audio)

(defun make-rendering-settings ()
  (c-let ((settings (:struct renderingsettings) :alloc t))
    (setf (settings :samplingrate)    44100
          (settings :framesize)       01024
          (settings :convolutiontype) :phonon)
    (settings &)))

(defun make-hrtf-params ()
  (c-let ((hrtf (:struct hrtfparams) :alloc t))
    (setf (hrtf :type)         :default
          (hrtf :hrtfdata)     (cffi:null-pointer)
          (hrtf :sofafilename) (cffi:null-pointer))
    (hrtf &)))

;; iplDestroyBinauralRenderer
(defun create-binaural-renderer (context)
  (let ((renderer (cffi:foreign-alloc :pointer)))
    (ipl-create-binaural-renderer context
                                  (make-rendering-settings)
                                  (make-hrtf-params)
                                  renderer)
    renderer))
