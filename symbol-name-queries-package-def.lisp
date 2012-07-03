;;;; package.lisp

(defpackage #:symbol-name-queries
  (:use #:cl #:lisp-unit)
  (:export :unique-syms
	   :_symb-p
	   :?!-symbol-p
	   :@0-symbol-p
	   :@1-symbol-p
	   :@.-symbol-p
	   :@#-symbol-p))

