#|
    Most Lisp implementations include a primitive called `runtime` that returns an integer that specifies the amount of time the system has been running 
    (measured, for example, in microseconds). The following `timed-prime-test` procedure, when called with an integer `n`, 
    prints `n` and checks to see if `n` is prime. If `n` is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.

    (define (timed-prime-test n)
        (newline)
        (display n)
        (start-prime-test n (runtime)))

    (define (start-prime-test n start-time)
        (if (prime? n)
            (report-prime (- (runtime) start-time))))

    (define (report-prime elapsed-time)
        (display " *** ")
        (display elapsed-time))

    Using this procedure, write a procedure `search-for-primes` that checks the primality of consecutive odd integers in a specified range. 
    1. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. 
    Note the time needed to test each prime. Since the testing algorithm has order of growth of O(√n), 
    you should expect that testing for primes around 10,000 should take about 10 times as long as testing for primes around 1000. 
    2. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the `n` prediction? 
    3. Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?
 |#

 (define (timed-prime-test n)
        (start-prime-test n (runtime)))

 (define (start-prime-test n start-time)
    (if (prime? n)
         (report-prime n (- (runtime) start-time))  
         0))

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

 (define (search-for-primes-iter n-test n-count)
   (cond ((= n-count 0) n-count) 
         ((even? n-test) (search-for-primes-iter (+ n-test 1) n-count))
         (else 
            (if (= (timed-prime-test n-test) n-test)
               (search-for-primes-iter (+ n-test 2) (- n-count 1))
               (search-for-primes-iter (+ n-test 2) n-count)))))

 (define (search-for-primes start-n n-count)
    (search-for-primes-iter start-n n-count))

(search-for-primes 1000 3) 
; *** 1009 0.
; *** 1013 0.
; *** 1019 0.

(search-for-primes 10000 3) 
; *** 10007 0.
; *** 10009 0.
; *** 10037 0.

(search-for-primes 100000 3) 
; *** 100003 0.
; *** 100019 0.
; *** 100043 0.

(search-for-primes 1000000 3)
; *** 1000003 9.999999999999998e-3
; *** 1000033 0.
; *** 1000037 0.

; I had to run tests on greater integers to see a runtime value over 0 on my machine. 

(search-for-primes 100000000000 3)
; *** 100000000003 .24
; *** 100000000019 .25
; *** 100000000057 .24

(search-for-primes 10000000000000 3)
; *** 10000000000037 2.39
; *** 10000000000051 2.43
; *** 10000000000099 2.42

(search-for-primes 100000000000000 3)
; *** 100000000000031 7.88
; *** 100000000000067 7.65
; *** 100000000000097 7.64

(search-for-primes 1000000000000000 3)
; *** 1000000000000037 24.76
; *** 1000000000000091 24.21
; *** 1000000000000159 24.5

;2. I increased the test value by 10 in the three last tests so the order of growth should be √10 ≈ 3.16. 
; 7.88/2.39 ≈ 3.29
; 24.76/7.88 ≈ 3.14
; So the results fit the estimate.