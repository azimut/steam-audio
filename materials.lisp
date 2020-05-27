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

(defun get-material-parameters (material)
  (alexandria:assoc-value *materials* material))

(defun make-materials (&rest materials)
  (let ((n-materials (length materials)))
    (c-let ((m (:struct steam-audio/raw::iplmaterial) :alloc t :count n-materials))
      (loop :for material :in materials
            :for params   := (get-material-parameters material)
            :for i        :from 0
            :do (setf (m i :lowfreqabsorption)    (nth 0 params)
                      (m i :midfreqabsorption)    (nth 1 params)
                      (m i :highfreqabsorption)   (nth 2 params)
                      (m i :scattering)           (nth 3 params)
                      (m i :lowfreqtransmission)  (nth 4 params)
                      (m i :midfreqtransmission)  (nth 5 params)
                      (m i :highfreqtransmission) (nth 6 params)))
      (print (m 0))
      (print (m 1))
      (m &))))
