;Code from class

#lang racket

;get all permutations of the nummbers
(define all-nos(permutations(list 100 50 25 10 1 1)))

;define list of operators
;using ' as its more readable in the console output
(define ops(list '+ '- '* '/))

;get all combinations of the operators
(define all-ops(cartesian-product ops ops ops ops ops))

;get all combinations of ops and numbers
(cartesian-product all-ops all-nos)
