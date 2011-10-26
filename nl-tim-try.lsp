#!/usr/bin/newlisp

;;;
;;; This file is a part of the **newlisp-dict** project, release under
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
              (list 1 "1" 'abc (array 3 '(1 4 "aoeu"))
                    '(1 4 3))))

(exit)

;; (context 'MAIN)
;; (exit)
