#lang racket

;-----------------------------------------
;        Second Stack Implmentation
;-----------------------------------------

;http://stackoverflow.com/questions/29244677/implementation-of-lifo-list-in-scheme
(define (make-stack)
  ;let the stack be empty
  (let ((stack '()))
    (lambda (msg . args)
      ;if to handle pop, push and stack
      (cond
        ;if its pop take the last element off the list
        [(eq? msg 'pop!)  (set! stack (cdr stack))]
        ;if its push add the element to the end of the stack
        [(eq? msg 'push!) (set! stack (append (reverse args) stack))]
        ;if its stack put out the stacks contents
        [(eq? msg 'stack) stack]
        ;else something went wrong
        [else "Not valid message!"]))))

(define s (make-stack))
;put a onto the stack
(s 'push! 'a)
;put b c and d onto the stack
(s 'push! 'b 'c 'd)
;print ou the stack
(s 'stack)
;pop an item off the stack
(s 'pop!)
;show the items in the stack
(s 'stack)