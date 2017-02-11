#lang racket

;a list of the possible small values
(define small (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10))

;a list of the possible large values
(define large (list 25 50 75 100))

;generate a target value
(define (target) (displayln (random 100 1000)))

;call target
(target)