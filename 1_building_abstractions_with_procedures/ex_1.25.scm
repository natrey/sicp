#|
    Alyssa P. Hacker complains that we went to a lot of extra work in writing `expmod`. 
    After all, she says, since we already know how to compute exponentials, we could have simply written

    (define (expmod base exp m)
        (remainder (fast-expt base exp) m))

    Is she correct? Would this procedure serve as well for our fast prime tester? Explain.
 |#
#|
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
            (remainder (square (expmod base (/ exp 2) m))
                       m))
        (else
            (remainder (* base (expmod base (- exp 1) m))
                       m))))
 |#
#|
;usage (= (expmod a n n) a)
;(expmod 2 7 7)
(remainder (* 2 (expmod 2 (- 7 1) 7))
           7)
(remainder (* 2 (remainder (square (expmod 2 (/ 6 2) 7))
                           7))
           7)
(remainder (* 2 (remainder (square (remainder (* 2 (expmod 2 (- 3 1) 7))
                                              7))
                           7))
           7)
(remainder (* 2 (remainder (square (remainder (* 2 (remainder (square (expmod 2 (/ 2 2) 7))
                                                              7))
                                              7))
                           7))
           7)
(remainder (* 2 (remainder (square (remainder (* 2 (remainder (square (remainder (* 2 (expmod 2 (- 1 1) 7))
                                                                                 7))
                                                              7))
                                              7))
                           7))
           7)
(remainder (* 2 (remainder (square (remainder (* 2 (remainder (square (remainder (* 2 1)
                                                                                 7))
                                                              7))
                                              7))
                           7))
           7) 
(remainder (* 2 (remainder (square (remainder (* 2 (remainder (square 2)
                                                              7))
                                              7))
                           7))
           7) 
(remainder (* 2 (remainder (square (remainder 8
                                              7))
                           7))
           7) 
(remainder (* 2 (remainder 1
                           7))
           7)
(remainder 2
           7)
;Value: 2
|#

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
    (remainder (fast-expt base exp) m))

#|
;(expmod 2 7 7)
(remainder (fast-expt 2 7) 7)
(remainder (* 2 (fast-expt 2 (- 7 1))) 7)
(remainder (* 2 (square (fast-expt 2 (/ 6 2)))) 7)
(remainder (* 2 (square (* 2 (fast-expt 2 (- 3 1))))) 7)
(remainder (* 2 (square (* 2 (square (fast-expt 2 (/ 2 2)))))) 7)
(remainder (* 2 (square (* 2 (square (* 2 (fast-expt 2 (- 1 1))))))) 7)
(remainder (* 2 (square (* 2 (square (* 2 1))))) 7)
(remainder (* 2 (square (* 2 4))) 7)
(remainder 128 7)
;Value 2
|#

;Expmod procedure based on fast-expt gives the same result, so it works. 
;But comparing operands of final remainder execution we see that 128 (2^7) is much greater than 2. 
;So the larger prime number we test, the larger this squared sum will get and the time of computation will increase. 