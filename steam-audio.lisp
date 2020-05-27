;;;; steam-audio.lisp

(in-package #:steam-audio)

(defun create-context ()
  (let ((context (cffi:foreign-alloc :pointer)))
    (format t "old ctx ptr: ~a~%" (cffi:mem-ref context :pointer))
    (ipl-create-context (cffi:null-pointer)
                        (cffi:null-pointer)
                        (cffi:null-pointer)
                        context)
    (format t "new ctx ptr: ~a~%" (cffi:mem-ref context :pointer))
    (force-output)
    context))

(defun create-scene (context simulation)
  (let ((materials (make-material :rock :wood))
        (scene     (cffi:foreign-alloc :pointer)))
    (ipl-create-scene context
                      (cffi:null-pointer)
                      simulation
                      2
                      materials
                      (cffi:null-pointer)
                      (cffi:null-pointer)
                      (cffi:null-pointer)
                      (cffi:null-pointer)
                      (cffi:null-pointer)
                      scene)
    scene))

(defun create-environment (context simulation scene)
  (let ((environment (cffi:foreign-alloc :pointer)))
    (format t "old env ptr: ~a~%" (cffi:mem-ref environment :pointer))
    (ipl-create-environment context
                            (cffi:null-pointer)
                            simulation
                            scene
                            (cffi:null-pointer)
                            environment)
    (format t "new env ptr: ~a~%" (cffi:mem-ref environment :pointer))
    (force-output)
    environment))

(defun main ()
  (let* ((context     (create-context))
         ;;(renderer    (create-binaural-renderer context))
         (simulation  (make-default-simulation-settings))
         (scene       (create-scene       context simulation))
         (mesh        (create-default-static-mesh scene))
         (environment (create-environment context simulation scene)))
    nil))
