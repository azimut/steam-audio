#!/bin/bash

set -x
set -e

# cleanup
rm -f steam.lisp

# wrapper
swig -v \
     -cffi \
     -module steam \
     -noswig-lisp \
     -includeall steam.i
sed -i 's/cl:defconstant/define-constant/g' steam.lisp
mv steam.lisp ../steam-audio-cffi.lisp
