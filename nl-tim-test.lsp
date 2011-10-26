#!/usr/bin/newlisp

;;;
;;; This file is a part of the **newlisp-dict** project, release under
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
                '((1 2 3) (4 5 6 7))))
  )

(define-test (test_type-of)
  (assert= 'integer-t  (type-of 1))
  (assert= 'symbol-t   (type-of 'a))
  (assert= 'true-t     (type-of true))
  (assert= 'list-t     (type-of '(1 2 3)))
  (assert= 'array-t    (type-of (array 3 '(1 2 3))))
  (assert= 'string-t   (type-of "A string definitely"))
  (assest= 'list-t     (type-of '()))
  (assert= 'symbol-t   (type-of nil))
  )

(UnitTest:run-all 'NL-TIM-TEST)

(context 'MAIN)
(exit)
