#|
    Demonstrate that the Carmichael numbers listed in footnote 47 really do fool the Fermat test. 
    That is, write a procedure that takes an integer `n` and tests whether a^n is congruent to `a` modulo `n` for every a<n, 
    and try your procedure on the given Carmichael numbers.
 |#

 (define (square n)
    (* n n))

 (define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
            (remainder (square (expmod base (/ exp 2) m))
                       m))
        (else
            (remainder (* base (expmod base (- exp 1) m))
                       m))))

(define (find-smallest n)
    (/ (- n 1) 2))

(define (carmichael-check n)
    (define (congruent-modulo-check-iter a n)
        (cond ((= a 1) true)
              ((= (expmod a n n)))
              (else false)))
    (if (even? n) 
            false
            (congruent-modulo-check-iter (find-smallest n) n)))

(carmichael-check 561)  ;#t
(carmichael-check 1105) ;#t
(carmichael-check 1729) ;#t
(carmichael-check 2465) ;#t
(carmichael-check 2821) ;#t
(carmichael-check 6601) ;#t

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 561)  ;#f
(prime? 1105) ;#f
(prime? 1729) ;#f
(prime? 2465) ;#f
(prime? 2821) ;#f
(prime? 6601) ;#f

; Carmichael numbers pass the congruent modulo check, but are not prime numbers.