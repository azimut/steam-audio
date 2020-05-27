%module phonon
%{
/* Includes the header in the wrapper code */
#include "phonon.h"
%}

%insert("lisphead") %{
(cffi:define-foreign-library phonon
  (:unix "libphonon.so")
  (:darwin "libphonon.dylib")
  (:cygwin "phonon.dll")
  (t (:default "libphonon")))
(cffi:use-foreign-library phonon)
(in-package :steam-audio/raw)
%}

/*%feature("export");*/
/* %feature("intern_function", "1"); */

/* Parse the header file to generate wrappers */
%include "/usr/include/phonon.h"
