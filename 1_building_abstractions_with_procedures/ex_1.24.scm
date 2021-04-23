#|
    Modify the `timed-prime-test` procedure of exercise 1.22 to use `fast-prime?` (the Fermat method), 
    and test each of the 12 primes you found in that exercise. 

    1. Since the Fermat test has O(log n) growth, how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? 
    2. Do your data bear this out? Can you explain any discrepancy you find?
 |#

 (define (timed-prime-test n)
   (fast-prime? n 100000 (runtime)))

 (define (fast-prime? n times start-time)
  (cond ((= times 0) (report-prime n (- (runtime) start-time)))
        ((fermat-test n) (fast-prime? n (- times 1) start-time))
        (else 0)))

 (define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

 (define (expmod base exp m)
   (cond ((= exp 0) 1)
         ((even? exp)
            (remainder (square (expmod base (/ exp 2) m))
                       m))
         (else (remainder (* base (expmod base (- exp 1) m))
                          m)))) 

 (define (report-prime n elapsed-time)
    (newline)
    (display " *** ")
    (display n)
    (display " ")
    (display elapsed-time)
    (newline)
    n)

 (define (prime? n)
    (= n (smallest-divisor n)))

 (define (smallest-divisor n)
    (find-divisor n 2))

 (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

 (define (divides? a b)
    (= (remainder b a) 0))


(timed-prime-test 100000000003) ; 5.23
(timed-prime-test 100000000019) ; 5.24
(timed-prime-test 100000000057) ; 5.34

(timed-prime-test 10000000000037) ; 5.76
(timed-prime-test 10000000000051) ; 5.85
(timed-prime-test 10000000000099) ; 5.87

(timed-prime-test 1000000000000037) ; 6.89
(timed-prime-test 1000000000000091) ; 7.36
(timed-prime-test 1000000000000159) ; 7.60
