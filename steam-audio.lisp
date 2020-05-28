;;;; steam-audio.lisp

(in-package #:steam-audio)

(defun create-context ()
  (let ((context (cffi:foreign-alloc :pointer)))
    (format t "old ctx ptr: ~a~%" (cffi:mem-ref context :pointer))
    (print
     (steam-audio/raw::ipl-create-context (cffi:null-pointer)
                                          (cffi:null-pointer)
                                          (cffi:null-pointer)
                                          context))
    (format t "new ctx ptr: ~a~%" (cffi:mem-ref context :pointer))
    context))

(defun create-scene (context)
  (let ((materials (make-materials :rock))
        (scene     (cffi:foreign-alloc :pointer)))
    (format t "old scene ptr: ~a~%" (cffi:mem-ref scene :pointer))
    (print
     (steam-audio/raw::ipl-create-scene context
                                        (cffi:null-pointer)
                                        :IPL_SCENETYPE_PHONON
                                        1
                                        materials
                                        (cffi:null-pointer)
                                        (cffi:null-pointer)
                                        (cffi:null-pointer)
                                        (cffi:null-pointer)
                                        (cffi:null-pointer)
                                        scene))
    (format t "new scene ptr: ~a~%" (cffi:mem-ref scene :pointer))
    scene))

(defun create-environment (context simulation scene)
  (let ((environment (cffi:foreign-alloc :pointer)))
    (format t "old env ptr: ~a~%" (cffi:mem-ref environment :pointer))
    (steam-audio/raw::ipl-create-environment context
                                             (cffi:null-pointer)
                                             simulation
                                             scene
                                             (cffi:null-pointer)
                                             environment)
    (format t "new env ptr: ~a~%" (cffi:mem-ref environment :pointer))
    environment))


(defun get-direct-sound-path (environment source)
  (c-let ((listener-position (:struct steam-audio/raw::iplvector3) :alloc t)
          (listener-ahead    (:struct steam-audio/raw::iplvector3) :alloc t)
          (listener-up       (:struct steam-audio/raw::iplvector3) :alloc t))
    (setf (listener-position :x) 10s0
          (listener-position :y) 10s0
          (listener-position :z) 10s0)
    (setf (listener-ahead    :x) 1s0
          (listener-ahead    :y) 1s0
          (listener-ahead    :z) 1s0)
    (setf (listener-up       :x) 0s0
          (listener-up       :y) 1s0
          (listener-up       :z) 0s0)
    (steam-audio/raw::ipl-get-direct-sound-path environment
                                                (listener-position &)
                                                (listener-ahead    &)
                                                (listener-up       &)
                                                source
                                                0s0
                                                10
                                                :IPL_DIRECTOCCLUSION_NONE
                                                :IPL_DIRECTOCCLUSION_RAYCAST)))
