#!/usr/bin/newlisp

;;;
;;; This file is a part of the **newlisp-dict** project, release under
;;; the terms of the MIT License
;;;
;;; See COPYING for more details.
;;;
;;; Copyright (c) 2011 by Dương "Yang" ヤン Hà Nguyễn <cmpitg@gmail.com>
;;;

(context 'MAIN)

(define *type-symbols-lst*
  (list 'list-t 'integer-t 'string-t 'symbol-t
        'array-t 'true-t 'dict-t))

(define *functions-lst*
  (list 'zip 'type-of 'make-global))

;;; @doc: Inspired by Python's ``zip`` function.
(define (zip)
  "zip 2 or more lists"
  (letn ((n (apply min (map length (args)))) ; get the minimum length
         (n-lst (length (args)))             ; number of list
         (res '()))                          ; result
    (dotimes (i-elem n)
      (letn (tmp '())
        (dotimes (item n-lst)
          (push ((args item) i-elem) tmp -1))
        (push tmp res -1)))
    res))

(define (type-of symbol)

  (define (investigate-type lst)
    (if (null? lst)                'list-t ; empty list
        (= 1 (length lst))         'list-t ; one-element list
        (= (first lst)    'dict-t) 'dict-t ; dict
                                   'list-t ; ordinary list
        )
    )

  (if (integer? symbol)  'integer-t
      (string? symbol)   'string-t
      (symbol? symbol)   'symbol-t
      (array? symbol)    'array-t
      (list? symbol)     (investigate-type symbol)
      (true? symbol)     'true-t
                         'symbol-t
      )
)

;;;
;;; helpers
;;;

(define (make-global)
  (dolist (sb (args))
    (if (symbol? sb)
        (global sb))))

;;; making all the type symbols global

(apply make-global *type-symbols-lst*)

;;; making all the functions global

(apply make-global *functions-lst*)

(context 'MAIN)
