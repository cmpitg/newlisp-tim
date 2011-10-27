#!/usr/bin/newlisp

;;;
;;; This file is a part of the **newlisp-tim** project, release under
;;; the terms of the MIT License
;;;
;;; See COPYING for more details.
;;;
;;; Copyright (c) 2011 by Dương "Yang" ヤン Hà Nguyễn <cmpitg@gmail.com>
;;;

;;; require cmpitg's nl-unittest

(load "nl-tim.lsp")


(context 'NL-TIM-TEST)

(define-test (test_zip)
  (assert= '((1 2) (3 4) (5 6))
           (zip '(1 3 5)
                '(2 4 6)))

  (assert= '() (zip '()))

  (assert= '((a b) (b 2))
           (zip '(a b c) '(b 2)))

  (assert= '((a 1 "A") (b 2 "B") (c 3 "C"))
           (zip '(a b c)
                '(1 2 3 10)
                '("A" "B" "C" "D")))

  (assert= '((first-lst (1 2 3)) (second-lst (4 5 6 7)))
           (zip '(first-lst second-lst)
                '((1 2 3) (4 5 6 7)))))

(define-test (test_type-of)
  (assert= "boolean"  (type-of true))
  (assert= "boolean"  (type-of nil))
  (assert= "integer"  (type-of 1))
  (assert= "string"   (type-of "string"))
  (assert= "symbol"   (type-of 'a-symbol))
  (assert= "array"    (type-of (array 4 (list 1 'a "a" (list 1 2)))))
  (assest= "list"     (type-of '(1 4 5)))
  (assert= "context"  (type-of MAIN))
  (assert= "lambda"   (type-of (fn (a-lambda) nil))))

(UnitTest:run-all 'NL-TIM-TEST)

(context 'MAIN)
(exit)
