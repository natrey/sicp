#|
    a. Define a procedure `double` that takes a procedure of one argument as argument and 
    returns a procedure that applies the original procedure twice. 
    For example, if `inc` is a procedure that adds 1 to its argument, 
    then (double inc) should be a procedure that adds 2. 
    
    b. What value is returned by (((double (double double)) inc) 5)?
|#

;a.
(define (double f)
    (lambda (x) (f (f x))))

;test
(define (inc x) (+ x 1))

((double inc) 1)
;Value: 3

;b.
;(((double (double double)) inc) 5)
;Value: 21

(((double double) inc) 5) ;9
;double double becomes an application of f 4 times.
;Applying `double` ones more becomes 4 * 4 = 16 times.
; 5 + 16 = 21.