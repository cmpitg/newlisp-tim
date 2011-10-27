#!/usr/bin/newlisp

;;;
;;; This file is a part of the **newlisp-tim** project, release under
;;; the terms of the MIT License
;;;
;;; See COPYING for more details.
;;;
;;; Copyright (c) 2011 by Dương "Yang" ヤン Hà Nguyễn <cmpitg@gmail.com>
;;;

(load "nl-tim.lsp")

(context 'Something)

(println (zip '(1 2 3) '(a b c) '(3 2 1)))
(println (zip '(1 2 3) '(a b c)))

(println (map (fn (s)
                (println s "\t\t => " (type-of s)))
              (list true
                    nil
                    1
                    "string"
                    'abc
                    (array 2 '(4 "a"))
                    '(1 4 3)
                    MAIN
                    (fn (x) nil))))

;; (context 'MAIN)
;; (exit)
