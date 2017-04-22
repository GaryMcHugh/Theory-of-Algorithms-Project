;Code from class

#lang racket

;define a list of ops and numebrs
;-1 represents operators
;1 represents numbers
(define start-perm (list -1 -1 -1 -1 1 1 1 1))
;take one -1 away as list has to end with an operator
;take two 1's away as list has to start with 2 numbers

;get all permutations of the defiend numbers and operators
(define x (remove-duplicates (permutations start-perm)))

;ad on the 2 1's at the start and -1 to the end
(define (make-rpn l)
  (append (list 1 1) l (list -1)))

;put the 1's and -1 onto the output of x at each iteration
(map make-rpn x)

; e is the gernerated permutation
; s is the stack

;optional arguement to the func with default value of 0
(define (valid-rpn? e [s 0])
  (if(null? e)
     (if (= s 1) #t #f)
     (if(= (car e) 1)
         ;if the first thing on e is 1
         (valid-rpn? (cdr e)(+ 1 s))
         (if(> s 1)
           (valid-rpn? (cdr e) (- 1 s))
           #f)
         )))
     