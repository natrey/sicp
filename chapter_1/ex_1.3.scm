#|
    Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
|#

(define (square x) (* x x))
(define (squares-sum x y) (+ (square x) (square y)))

(define (two-largest-squares-sum x y z)
    (cond ((and (< x y) (< x z)) (squares-sum y z))
          ((and (< y x) (< y z)) (squares-sum x z))
          (else (squares-sum x y)))
)
