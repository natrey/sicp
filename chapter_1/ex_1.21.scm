#|
    Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999.
 |#

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder a b) 0))

(define (square n)
    (* n n))

(define (remainder a b)
  (if (or (> a b) (= a b)) (remainder (- a b) b) a))

(smallest-divisor 199) ;199
(smallest-divisor 1999) ;1999
(smallest-divisor 19999) ;7