(in-package #:steam-audio)

(defvar *materials*
  '((:generic  . (0.10f0 0.20f0 0.30f0 0.05f0 0.100f0 0.050f0 0.030f0))
    (:brick    . (0.03f0 0.04f0 0.07f0 0.05f0 0.015f0 0.015f0 0.015f0))
    (:concrete . (0.05f0 0.07f0 0.08f0 0.05f0 0.015f0 0.002f0 0.001f0))
    (:ceramic  . (0.01f0 0.02f0 0.02f0 0.05f0 0.060f0 0.044f0 0.011f0))
    (:gravel   . (0.60f0 0.70f0 0.80f0 0.05f0 0.031f0 0.012f0 0.008f0))
    (:carpet   . (0.24f0 0.69f0 0.73f0 0.05f0 0.020f0 0.005f0 0.003f0))
    (:glass    . (0.06f0 0.03f0 0.02f0 0.05f0 0.060f0 0.044f0 0.011f0))
    (:plaster  . (0.12f0 0.06f0 0.04f0 0.05f0 0.056f0 0.056f0 0.004f0))
    (:wood     . (0.11f0 0.07f0 0.06f0 0.05f0 0.070f0 0.014f0 0.005f0))
    (:metal    . (0.20f0 0.07f0 0.06f0 0.05f0 0.200f0 0.025f0 0.010f0))
    (:rock     . (0.13f0 0.20f0 0.24f0 0.05f0 0.015f0 0.002f0 0.001f0))))

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
