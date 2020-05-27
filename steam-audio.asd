;;;; steam-audio.asd

(asdf:defsystem #:steam-audio
  :description "Describe steam-audio here"
  :author "azimut <azimut.github@protonmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:cffi
               #:cffi-c-ref
               #:alexandria)
  :components ((:file "package")
               (:file "steam-audio-cffi")
               (:file "materials")
               (:file "render")
               (:file "simulation")
               (:file "source")
               (:file "mesh")
               (:file "steam-audio")))

(asdf:defsystem #:steam-audio/testa
  :description "Describe steam-audio here"
  :author "azimut <azimut.github@protonmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:steam-audio
               #:dendrite)
  :components ((:file "testa")))

(asdf:defsystem #:steam-audio/example
  :description "Describe steam-audio here"
  :author "azimut <azimut.github@protonmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:bodge-sndfile
               #:sndfile-blob
               #:steam-audio)
  :components ((:file "example")))
