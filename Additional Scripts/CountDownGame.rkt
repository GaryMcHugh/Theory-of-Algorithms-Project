#lang racket

;final attempt at problem.... didn't work

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

; e is the gernerated permutation (the equation being passed)
; s is the stack

;optional argument to the function with default value of 0
(define (valid-rpn? e [s 0])
  ;check if e is null 
  (if(null? e)
     ;check if the stack is equal to one
     (if (= s 1) #t #f)
      ;if the next thing on the expression is 1 (a number) its valid rpn so proceed.
     (if(= (car e) 1)
        ;pass the rest of e to valid rpn and add 1 to the stack
         (valid-rpn? (cdr e)(+ 1 s))
         ; must be an operator if it hits this if statement as its not a 1 (a number)
         ; if the stack is greater than one (if we can apply the operator to the stack)
         (if(> s 1)
            ;pass the rest of e to the stack and decrease the stack by one
           (valid-rpn? (cdr e) (- 1 s))
           ;print out false if stack is less than one
           #f)
         )))

;-----------------------------------------
;     Using valid rpn and rpn solver
;-----------------------------------------

;function to sum list using RPN function
; function called sum that takes in a list l
(define (sum l)
  ;check if l is null
  (if (null? l)
      0
      ;use the calculate rpn function to evaluate the list
      (if (valid-rpn? (car (car l)))
          ((write (car (car l))) (writeln (calculate-RPN (car(car l))))(sum (cdr l)) )
          (sum (cdr l)))))
 