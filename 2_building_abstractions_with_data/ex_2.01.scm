#|
    Define a better version of `make-rat` that handles both positive and negative arguments. 
    `Make-rat` should normalize the sign so that if the rational number is positive, 
    both the numerator and denominator are positive, and if the rational number is negative, only the numerator is negative.
|#

(define (make-rat n d)
    (if (> (/ n d) 0)
        (cons n d)
        (cons (* (abs n) -1) (abs d))))

(make-rat 1 -2)
;Value: (-1 . 2)

(make-rat 1 3)
;Value: (1 . 3)