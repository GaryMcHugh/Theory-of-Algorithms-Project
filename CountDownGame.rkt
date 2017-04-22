#lang racket

(define operators '(* / + -))

;-----------------------------------------
;        Reverse Polish Notation
;-----------------------------------------

;https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket
'rpn-solver

(define (calculate-RPN expr)
  (for/fold ([stack '()]) ([token expr])
    (printf "~a\t -> ~a~N" token stack)
    (match* (token stack)
     [((? number? n) s) (cons n s)]
     [('+ (list x y s ___)) (cons (+ x y) s)]
     [('- (list x y s ___)) (cons (- y x) s)]
     [('* (list x y s ___)) (cons (* x y) s)]
     [('/ (list x y s ___)) (cons (/ y x) s)]
     [('^ (list x y s ___)) (cons (expt y x) s)]
     [(x s) (error "calculate-RPN: Cannot calculate the expression:" 
                   (reverse (cons x s)))])))

;-----------------------------------------
;            stack from class
;-----------------------------------------

; e is the gernerated permutation
; s is the stack

;optional arguement to the func with default value of 0
(define (valid-rpn? e [s 0])
  ;check if e is null 
  (if(null? e)
     ;check if the stack is equal to one
     (if (= s 1) #t #f)
      ;if the first thing on e is 1
     (if(= (car e) 1)
         (valid-rpn? (cdr e)(+ 1 s))
         ; if the stack is greater than one
         (if(> s 1)
            ;take one from stack
           (valid-rpn? (cdr e) (- 1 s))
           ;print out false if stack is less than one
           #f)
         )))