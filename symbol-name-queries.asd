;;;; symbol-processing.asd

(asdf:defsystem #:symbol-name-queries
  :serial t
  :description "Manipulation of symbol names"
  :author "Mirko Vukovic <mirko.vukovic@gmail.com>"
  :license "GNU Public License"
  :version "0.1"
  :depends-on (#:alexandria
               #:anaphora
               #:split-sequence
               #:lisp-unit)
  :components ((:file "symbol-name-queries-package-def")
               (:file "symbol-name-queries")))

