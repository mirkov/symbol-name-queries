;;;; symbol-processing.lisp

(in-package #:symbol-processing)

;;; "symbol-processing" goes here. Hacks and glory await!

  (defun unique-syms (symbol-list)
    "Return unique symbols from the `symbol-list', ignoring all
non-symbols"
    (remove-if-not #'symbolp
		   (remove-duplicates symbol-list)))

(defun _symb-p (symb)
  "tests if a symbol has the `_' character"
  (and (symbolp symb)
       (let ((symb-name (symbol-name symb)))
	 (find #\_ symb-name))))

(define-test _symb-p
  (assert-true (_symb-p 'foo_bar))
  (assert-true (not (_symb-p 'foo))))