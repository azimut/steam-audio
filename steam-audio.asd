;;;; steam-audio.asd

(asdf:defsystem #:steam-audio
  :description "Describe steam-audio here"
  :author "azimut <azimut.github@protonmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:cffi)
  :components ((:file "package")
               (:file "steam-audio")))
