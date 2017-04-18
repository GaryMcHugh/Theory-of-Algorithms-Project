;Author: Gary McHugh
;Date:16th February 2017

#lang racket

;a list containing all possible values
(define values (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

;list to hold the 6 randomly selected numbers
(define selected(list))

(define selecting(list 1 2 3))

;list of operators that will be used
(define operators '(* / + -))

;generate a target value
;https://www.reddit.com/r/Racket/comments/32g9v3/how_do_you_generate_random_numbers/
(define (target) (displayln (random 101 1000)))

;call target
'target-value
(target)

;randomly select a value from the values list
;https://www.rosettacode.org/wiki/Pick_random_element#Racket
(define (pick-item list)
  ;define a function called selectValues to recurse on
  (define selectValues(list-ref list (random (length list))))
  ;cons the selected value thats returned from the selectedValues onto the selected list
  ;http://docs.racket-lang.org/reference/set_.html
  (set! selected(cons selectValues selected))
  ;https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Fprivate%2Flist..rkt%29._remove%29%29
    (set! list (remove selectValues list))
  
  ;if the length of the selected list is not 6 recurse on pick-item
  ;http://stackoverflow.com/questions/30041672/if-else-clause-or-cond-in-racket
  ;https://docs.racket-lang.org/reference/booleans.html
  ;24 for testing purposes
    (if (equal? (length selected)6)
      selected
      (pick-item list)
    ) ;if
  )

;call pick-item
'list-of-6-numbers
(pick-item values)
;showing list contains a value
;(displayln selected)

'combinations-of-6-numbers
(combinations selected)

;define a function called subsetsum to take a list
(define (addAll l)
   ;map the + operator to the combinations of the list without brackets, i.e. evaluate the function
   (map
    (lambda (i) (apply + i))
   (combinations l)))

;adds all permutations of the numbers together
'adding-all-combinations
(addAll selected)

;define a function called subsetsum to take a list
(define (multAll l)
   ;map the * operator to the combinations of the list without brackets, i.e. evaluate the function
   (map
    (lambda (i) (apply * i))
   (combinations l)))

;adds all permutations of the numbers together
'multiplying-all-combinations
(multAll selected)

;get all combinations of 5 operators
;five as we will need five when using reverse polish notation to solve six numbers
'cartesian-product-of-operators
(cartesian-product operators operators operators operators operators)

'permutations-of-6-numbers
(permutations selected)

;-----------------------------------------
;        Working out calculations
;-----------------------------------------
'rough-work

;working out solution using 2 numbers
(define t 125)
(define a 5)
(define b  25)

(define l (list    
          (+ a b)
          (+ b a)
          (- a b)
          (- b a)
          (/ a b)
          (/ b a)
          (* a b)
          (* b a)
))
l

;moving onto understanding adding a number
(define x 10)
(define y 5)
(define z 2)

(define m (list    
          (+(+ x y) z)
          (-(+ x y) z)
          (/(+ x y) z)
          (*(+ x y) z)
          (+(+ y x) z)
          (-(+ y x) z)
          (/(+ y x) z)
          (*(+ y x) z)
          (+(- x y) z)
          (-(- x y) z)
          (/(- x y) z)
          (*(- x y) z)
          (+(- y x) z)
          (-(- y x) z)
          (/(- y x) z)
          (*(- y x) z)
          (+(/ x y) z)
          (-(/ x y) z)
          (/(/ x y) z)
          (*(/ x y) z)
          (+(/ y x) z)
          (-(/ y x) z)
          (/(/ y x) z)
          (*(/ y x) z)
          (+(* x y) z)
          (-(* x y) z)
          (*(* x y) z)
          (-(* x y) z)
          (+(* y x) z)
          (-(* y x) z)
          (/(* y x) z)
          (*(* y x) z)
))


;-----------------------------------------------------------
;        Using Permutations, combinations and map
;-----------------------------------------------------------

;(permutations (list 1 2 3 4 1))

;(combinations (list 1 2 3 4) 2)

(define (plus l)
  (+(car l)(cadr l)))

(map plus (combinations (list 1 2 3 4) 2))

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

(calculate-RPN '(4 13 5 / +))

(calculate-RPN '(2 1 + 3 *))