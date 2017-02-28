;Author: Gary McHugh
;Date:16th February 2017

#lang racket

;a list containing all possible values
(define values (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

;list to hold the 6 randomly selected numbers
(define selected(list))

;generate a target value
;https://www.reddit.com/r/Racket/comments/32g9v3/how_do_you_generate_random_numbers/
(define (target) (displayln (random 101 1000)))

;call target
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
(pick-item values)
;showing list contains a value
;(displayln selected)

;-----------------------------------------
;        Working out calculations
;-----------------------------------------

'working 'out 'calculations

;(permutations (list 1 2 3 4))

(combinations (list 1 2 3 4) 0)

(define (plus l)
  (+(car l)(cadr l)))

(map plus (combinations (list 1 2 3 4 5) 2))
