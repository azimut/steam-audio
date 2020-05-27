(in-package #:steam-audio)

(defvar *materials*
  '((:generic  . (0.10s0 0.20s0 0.30s0 0.05s0 0.100s0 0.050s0 0.030s0))
    (:brick    . (0.03s0 0.04s0 0.07s0 0.05s0 0.015s0 0.015s0 0.015s0))
    (:concrete . (0.05s0 0.07s0 0.08s0 0.05s0 0.015s0 0.002s0 0.001s0))
    (:ceramic  . (0.01s0 0.02s0 0.02s0 0.05s0 0.060s0 0.044s0 0.011s0))
    (:gravel   . (0.60s0 0.70s0 0.80s0 0.05s0 0.031s0 0.012s0 0.008s0))
    (:carpet   . (0.24s0 0.69s0 0.73s0 0.05s0 0.020s0 0.005s0 0.003s0))
    (:glass    . (0.06s0 0.03s0 0.02s0 0.05s0 0.060s0 0.044s0 0.011s0))
    (:plaster  . (0.12s0 0.06s0 0.04s0 0.05s0 0.056s0 0.056s0 0.004s0))
    (:wood     . (0.11s0 0.07s0 0.06s0 0.05s0 0.070s0 0.014s0 0.005s0))
    (:metal    . (0.20s0 0.07s0 0.06s0 0.05s0 0.200s0 0.025s0 0.010s0))
    (:rock     . (0.13s0 0.20s0 0.24s0 0.05s0 0.015s0 0.002s0 0.001s0))))

(defun make-material (&rest materials)
  (let ((m (cffi:foreign-alloc '(:struct material) :count (length materials))))
    (loop :for mat :in materials
          :for i :from 0
          :do (cffi:with-foreign-slots ((lowfreqabsorption
                                         midfreqabsorption
                                         highfreqabsorption
                                         scattering
                                         lowfreqtransmission
                                         midfreqtransmission
                                         highfreqtransmission)
                                        (cffi:mem-aptr m '(:struct material) i)
                                        (:struct material))
                (let ((params (cdr (assoc mat *materials*))))
                  (setf lowfreqabsorption    (nth 0 params))
                  (setf midfreqabsorption    (nth 1 params))
                  (setf highfreqabsorption   (nth 2 params))
                  (setf scattering           (nth 3 params))
                  (setf lowfreqtransmission  (nth 4 params))
                  (setf midfreqtransmission  (nth 5 params))
                  (setf highfreqtransmission (nth 6 params)))))
    (print (cffi:mem-aref m '(:struct material) 0))
    (print (cffi:mem-aref m '(:struct material) 1))
    (print m))
  #+nil
  (alexandria:if-let ((params (cdr (assoc material *materials*))))
    (c-let ((material (:struct material) :alloc t :count (length materials)))
      (setf (material :lowfreqabsorption)    (nth 0 params)
            (material :midfreqabsorption)    (nth 1 params)
            (material :highfreqabsorption)   (nth 2 params)
            (material :scattering)           (nth 3 params)
            (material :lowfreqtransmission)  (nth 4 params)
            (material :midfreqtransmission)  (nth 5 params)
            (material :highfreqtransmission) (nth 6 params))
      (material &))
    (error "wrong material index")))
