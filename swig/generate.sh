#!/bin/bash
set -exuo pipefail

# cleanup
rm -f ./phonon.lisp

swig -v \
     -cffi \
     -module phonon \
     -noswig-lisp \
     -includeall phonon.i

sed -i 's/cl:defconstant/alexandria:define-constant/g' phonon.lisp
mv phonon.lisp ../steam-audio-cffi.lisp
