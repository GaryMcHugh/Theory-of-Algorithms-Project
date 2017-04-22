;Author: Gary McHugh
;Date:16th February 2017

#lang racket

;a list containing all possible values
(define values (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

;list to hold the 6 randomly selected numbers
(define selected(list))

;list of operators that will be used
(define operators '(* / + -))


;-----------------------------------------
;        Generate Target Number
;-----------------------------------------
;generate a target value
;https://www.reddit.com/r/Racket/comments/32g9v3/how_do_you_generate_random_numbers/
(define (target) (displayln (random 101 1000)))

;call target
'target-value
(target)


;-----------------------------------------
;           Select six numbers
;-----------------------------------------

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


;-----------------------------------------
;       combinatios of six numbers
;-----------------------------------------
'combinations-of-6-numbers
(combinations selected)


;-------------------------------------------
;        add combinations together
;-------------------------------------------

;define a function called subsetsum to take a list
(define (addAll l)
   ;map the + operator to the combinations of the list without brackets, i.e. evaluate the function
   (map
    (lambda (i) (apply + i))
   (combinations l)))

;adds all permutations of the numbers together
'adding-all-combinations
(addAll selected)



;-----------------------------------------
;      multiply combinations together
;-----------------------------------------

;define a function called subsetsum to take a list
(define (multAll l)
   ;map the * operator to the combinations of the list without brackets, i.e. evaluate the function
   (map
    (lambda (i) (apply * i))
   (combinations l)))

;adds all permutations of the numbers together
'multiplying-all-combinations
(multAll selected)



;-----------------------------------------
;     All combinations of 5 operators
;-----------------------------------------

;get all combinations of 5 operators
;five as we will need five when using reverse polish notation to solve six numbers
'cartesian-product-of-operators
(cartesian-product operators operators operators operators operators)


;-----------------------------------------
;      Permutations of six numbers
;-----------------------------------------

'permutations-of-6-numbers
(permutations selected)


;-----------------------------------------
;            Create Valid RPN
;-----------------------------------------

'valid-rpn-maker
;define a list of ops and numebrs
;-1 represents operators
;1 represents numbers
(define start-perm (list -1 -1 -1 -1 1 1 1 1))
;take one -1 away as list has to end with an operator
;take two 1's away as list has to start with 2 numbers

;get all permutations of the defiend numbers and operators
(define rpn (remove-duplicates (permutations start-perm)))

;ad on the 2 1's at the start and -1 to the end
(define (make-rpn l)
  (append (list 1 1) l (list -1)))

;put the 1's and -1 onto the output of x at each iteration
(map make-rpn rpn)


;-----------------------------------------
;     Reverse Polish Notation Solver
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

