#lang racket

;a list of the possible small values
(define small (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10))

;a list of the possible large values
(define large (list 25 50 75 100))

;generate a target value
;added a loop to test range
;https://www.reddit.com/r/Racket/comments/32g9v3/how_do_you_generate_random_numbers/
(define (target) (for ([i 9000]) (displayln (random 100 1000))))

;call target
(target)