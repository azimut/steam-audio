(in-package #:steam-audio)

(defun make-rendering-settings ()
  (c-let ((settings (:struct steam-audio/raw::iplrenderingsettings) :alloc t))
    (setf (settings :samplingrate)    44100
          (settings :framesize)       01024
          (settings :convolutiontype) :IPL_CONVOLUTIONTYPE_PHONON)
    (settings &)))

(defun make-hrtf-params ()
  (c-let ((hrtf (:struct steam-audio/raw::iplhrtfparams) :alloc t))
    (setf (hrtf :type)         :IPL_HRTFDATABASETYPE_DEFAULT
          (hrtf :hrtfdata)     (cffi:null-pointer)
          (hrtf :sofafilename) (cffi:null-pointer))
    (hrtf &)))

;; iplDestroyBinauralRenderer
(defun create-binaural-renderer (context)
  (let ((renderer (cffi:foreign-alloc :pointer)))
    (steam-audio/raw::ipl-create-binaural-renderer context
                                                   (make-rendering-settings)
                                                   (make-hrtf-params)
                                                   renderer)
    renderer))
