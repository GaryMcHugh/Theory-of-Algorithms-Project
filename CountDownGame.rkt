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