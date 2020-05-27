(in-package #:steam-audio)

(defun create-default-static-mesh (scene)
  "Creates a default cube into SCENE for testing"
  (destructuring-bind (vertices faces)
      (dendrite.primitives:box-data :normals nil :tex-coords nil)
    (create-static-mesh vertices faces scene)))


(defvar *env*)
(defvar *source*)

(defun main ()
  (let* ((context     (create-context))
         ;;(renderer    (create-binaural-renderer context))
         (simulation  (make-default-simulation-settings))
         (scene       (create-scene               context simulation))
         (_           (create-default-static-mesh scene))
         (environment (create-environment         context simulation scene))
         (source      (make-source)))
    (declare (ignore _))
    (setf *env*   environment)
    (setf *source* source)
    nil))
