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

(define NL-TIM:FuncLst
  (list 'zip 'type-of 'make-global))

;;; See newlisp.h for more detail
(define NL-TIM:Types
  (list "boolean" "boolean" "integer" "float" "string" "symbol" "context"
        "primitive" "primitive" "primitive" "quote" "list" "lambda" "macro"
        "array"))

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

;;; see newlisp.h in newLISP's original source code for more detail
(define (type-of symbol)

  (define (investigate-type lst)
    (if (null? lst)                "list"           ; empty list
        (context? (first lst))     (term (first x)) ; FOOP
        (= 1 (length lst))         "list"           ; one-element list
        (= (first lst)    'dict-t) "dict"           ; dict
        (NL-TIM:Types (& 0xf ((dump symbol) 1)))))

  ;; (println "\n[DEBUG] type-of: " x " => " ((dump symbol) 1))
  (if (list? symbol)
      (investigate-type symbol)
      (NL-TIM:Types (& 0xf ((dump symbol) 1)))))

;;;
;;; helpers
;;;

(define (make-global)
  (dolist (sb (args))
    (if (symbol? sb)
        (global sb))))

;;; making all the functions global

(apply make-global NL-TIM:FuncLst)

(context 'MAIN)
