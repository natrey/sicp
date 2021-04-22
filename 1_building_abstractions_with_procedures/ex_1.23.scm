#|
    The `smallest-divisor` procedure shown at the start of this section does lots of needless testing: 
    After it checks to see if the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers. 
    This suggests that the values used for `test-divisor` should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, .... 
    To implement this change, define a procedure `next` that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. 
    Modify the `smallest-divisor` procedure to use (`next test-divisor`) instead of (`+ test-divisor 1`). 
    With `timed-prime-test` incorporating this modified version of `smallest-divisor`, run the test for each of the 12 primes found in exercise 1.22. 
    
    Since this modification halves the number of test steps, you should expect it to run about twice as fast. 
    Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, 
    and how do you explain the fact that it is different from 2?
 |#

 (define (next n)
    (if (= n 2) 3 (+ n 2)))

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
          (else (find-divisor n (next test-divisor)))))

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

(search-for-primes 100000000000 3)
; *** 100000000003 new: .15, old: .24
; *** 100000000019 new: .15, old: .25
; *** 100000000057 new: .15, old: .24

(search-for-primes 10000000000000 3)
; *** 10000000000037 new: 1.49, old: 2.39
; *** 10000000000051 new: 1.54, old: 2.43
; *** 10000000000099 new: 1.53, old: 2.42

(search-for-primes 100000000000000 3)
; *** 100000000000031 new: 4.83, old: 7.88
; *** 100000000000067 new: 4.77, old: 7.65
; *** 100000000000097 new: 4.77, old: 7.64

(search-for-primes 1000000000000000 3)
; *** 1000000000000037 new: 15.44, old: 24.76
; *** 1000000000000091 new: 15.43, old: 24.21
; *** 1000000000000159 new: 15.40, old: 24.5

; I get an improvement of speed by 1.6:
; .24/.15 ≈ 1.6
; 2.39/1.49 ≈ 1.6
; 7.88/4.83 ≈ 1.6
; 24.76/15.44 ≈ 1.6

; The increase is different from 2 because an additional `if` procedure is executed in the `next` procedure.