;;;; steam-audio.asd

(asdf:defsystem #:steam-audio
  :description "Describe steam-audio here"
  :author "azimut <azimut.github@protonmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:cffi)
  :components ((:file "package")
               (:file "steam-audio-cffi")
               (:file "steam-audio")))

(asdf:defsystem #:steam-audio/example
  :description "Describe steam-audio here"
  :author "azimut <azimut.github@protonmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:steam-audio
               #:sndfile-blob
               #:bodge-sndfile
               #:cffi-c-ref)
  :components ((:file "example")))
