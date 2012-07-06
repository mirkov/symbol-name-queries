;;;; symbol-processing.lisp

(in-package #:symbol-name-queries)

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

(defun ?!-symbol-p (? s)
  "Does the symbol start with `?!' where `?' stands for a single
character?.  If `s' is not symbol, return nil"
  (check-type ? string)
;;  (check-type s symbol)
  (and (typep s 'symbol)
       (> (length (symbol-name s)) 2)
       (string= (symbol-name s)
		(format nil "~a!" ?)
		:start1 0
		:end1 2)))

(defun @0-symbol-p (s)
  "Does the symbol start with `@0'.  Return nil if s is not a symbol"
  (typecase s
    (symbol
     (and (> (length (symbol-name s)) 2)
	  (string= (symbol-name s)
		   "@0"
		   :start1 0
		   :end1 2)))
    (t nil)))

(define-test @0-symbol-p
  (assert-true (@0-symbol-p '@0foo))
  (assert-true (not (@0-symbol-p '@1foo)))
  (assert-true (not (@0-symbol-p 3))))
  

(defun @1-symbol-p (s)
  "Does the symbol start with `@1'.  Return nil if s is not a symbol"
  (typecase s
    (symbol
     (and (> (length (symbol-name s)) 2)
	  (string= (symbol-name s)
		   "@1"
		   :start1 0
		   :end1 2)))
    (t nil)))

(define-test @1-symbol-p
  (assert-true (@1-symbol-p '@1foo))
  (assert-true (not (@1-symbol-p '@2foo)))
  (assert-true (not (@1-symbol-p 3))))

(defun @.-symbol-p (s)
  "Does the symbol start with `@.'.  Return nil if s is not a symbol"
  (typecase s
    (symbol
     (and (> (length (symbol-name s)) 2)
	  (string= (symbol-name s)
		   "@."
		   :start1 0
		   :end1 2)))
    (t nil)))

(defun @!-symbol-p (s)
  "Does the symbol start with `@!'.  Return nil if s is not a symbol"
  (typecase s
    (symbol
     (and (> (length (symbol-name s)) 2)
	  (string= (symbol-name s)
		   "@!"
		   :start1 0
		   :end1 2)))
    (t nil)))

(defun @#-symbol-p (s)
  "Does the symbol start with `@#'.  Return nil if s is not a symbol"
  (typecase s
    (symbol
     (and (> (length (symbol-name s)) 2)
	  (string= (symbol-name s)
		   "@#"
		   :start1 0
		   :end1 2)))
    (t nil)))


(define-test @#-symbol-p
  (assert-true (@#-symbol-p '@#foo))
  (assert-true (not (@#-symbol-p '@2foo)))
  (assert-true (not (@#-symbol-p 3))))