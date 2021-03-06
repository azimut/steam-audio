(in-package #:steam-audio)

(defun make-default-simulation-settings ()
  (c-let ((simulation (:struct steam-audio/raw::iplsimulationsettings) :alloc t))
    (setf (simulation :ambisonicsorder)        1
          (simulation :bakingbatchsize)        1
          (simulation :irduration)             1s0
          (simulation :irradiancemindistance)  0.1
          (simulation :maxconvolutionsources)  32
          (simulation :numbounces)             2
          (simulation :numdiffusesamples)      1024
          (simulation :maxnumocclusionsamples) 32
          (simulation :numrays)                4096
          (simulation :numthreads)             1
          (simulation :scenetype)              :IPL_SCENETYPE_PHONON)
    (format t "simulation: ~a~%" simulation)
    (format t "simulation ptr: ~a~%" (simulation &))
    (simulation &)))
