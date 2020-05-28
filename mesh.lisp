(in-package #:steam-audio)

(defun create-static-mesh (vertices faces scene)
  (let ((n-vertices (print (length vertices)))
        (n-faces    (print (/ (length faces) 3))))
    (c-let ((cvertices  (:struct steam-audio/raw::iplvector3)  :alloc t :count n-vertices)
            (cfaces     (:struct steam-audio/raw::ipltriangle) :alloc t :count n-faces)
            (imaterials :int     :alloc t :count n-faces)
            (mesh       :pointer :alloc t))
      (print vertices)
      (print faces)
      ;; Vertices
      (dotimes (i n-vertices)
        (setf (cvertices i :x) (aref (nth i vertices) 0)
              (cvertices i :y) (aref (nth i vertices) 1)
              (cvertices i :z) (aref (nth i vertices) 2)))
      (dotimes (i n-vertices)
        (print (cvertices i)))
      ;; Faces
      (loop :for (a b c) :on faces :by #'cdddr
            :for i :from 0 :by 3
            :for x :from 0
            :do (format t "abc: ~d,~d,~d  i:~d  x:~d~%" a b c i x)
                (setf (cfaces x :indices 0) (nth (+ i 0) faces)
                      (cfaces x :indices 1) (nth (+ i 1) faces)
                      (cfaces x :indices 2) (nth (+ i 2) faces)))
      (dotimes (i n-faces)
        (print (list (cfaces i :indices 0)
                     (cfaces i :indices 1)
                     (cfaces i :indices 2))))
      ;; Materials
      (dotimes (i n-faces) (setf (imaterials i) 1))
      (print (loop for i from 0 below n-faces collect (imaterials i)))
      ;; DO
      (steam-audio/raw::ipl-create-static-mesh scene
                                               n-vertices
                                               n-faces
                                               (cvertices  &)
                                               (cfaces     &)
                                               (imaterials &)
                                               mesh))))
