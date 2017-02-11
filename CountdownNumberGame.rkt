#lang racket

;a list containing all possible values
(define values (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

;generate a target value
;https://www.reddit.com/r/Racket/comments/32g9v3/how_do_you_generate_random_numbers/
(define (target) (displayln (random 101 1000)))

;call target
(target)

;randomly select a value from the values list
;https://www.rosettacode.org/wiki/Pick_random_element#Racket
(define (pick-item l)
  (if (null? l)
      ;if passed the null list passback 0
      0
      (list-ref l (random (length l)))))

;call pick-item
(pick-item values)