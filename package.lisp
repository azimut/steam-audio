;;;; package.lisp

(uiop:define-package #:steam-audio/raw
  (:use))

(uiop:define-package #:steam-audio
  (:use #:cl #:cffi-c-ref))
