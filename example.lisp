(uiop:define-package #:steam-audio.example
  (:use :cl :cffi-c-ref)
  (:export run))

(in-package #:steam-audio.example)

(defparameter *sample-file*
  (namestring
   (asdf:system-relative-pathname :bodge-sndfile/example
                                  "example/sample.ogg")))

(defun run ()
  "Native example reading metadata with thin API"
  (c-with ((sf-info %sf:info :clear t))
    (let ((sf-file (%sf:open *sample-file* %sf:+m-read+ (sf-info &))))
      (when (cffi:null-pointer-p sf-file)
        (error "Failed to open sound file ~A: ~A" *sample-file*
               (cffi:foreign-string-to-lisp (%sf:strerror sf-file))))
      (assert (member (sf-info :channels) '(1)))
      (assert (= 44100 (sf-info :samplerate)))
      (assert (plusp (sf-info :frames)))
      (c-let ((raw-output :float :alloc t :count (* (sf-info :channels)
                                                    (sf-info :frames))))
        (format t "read ~d bytes"
                (%sf:read-float sf-file (raw-output &) (* (sf-info :channels)
                                                          (sf-info :frames))))
        (let ((audiobuffer (cffi:foreign-alloc '(:struct steam-audio:audiobuffer))))
          (setf (cffi:foreign-slot-value audiobuffer
                                         '(:struct steam-audio:audiobuffer)
                                         'format)))
        (raw-output &)))))

;;(cffi:foreign-alloc '(:struct steam-audio:audiobuffer))




