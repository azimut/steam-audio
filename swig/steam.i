%module steam
%{
/* Includes the header in the wrapper code */
#include "phonon.h"
%}

%insert("lisphead") %{
(cffi:load-foreign-library "libphonon.so")
(in-package :steam-audio)
(defmacro define-constant (name value &optional doc)
  `(defconstant ,name (if (boundp ',name) (symbol-value ',name) ,value)
                      ,@(when doc (list doc))))
%}

%feature("export");
/* %feature("intern_function", "1"); */

/* Parse the header file to generate wrappers */
%include "/home/sendai/projects/steamaudio_api/include/phonon.h"
%include "/home/sendai/projects/steamaudio_api/include/phonon.h"
