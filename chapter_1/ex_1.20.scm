#|
    The process that a procedure generates is of course dependent on the rules used by the interpreter. 
    As an example, consider the iterative gcd procedure given.

    (define (gcd a b)
        (if (= b 0)
            a
            (gcd b (remainder a b)))) 

    Suppose we were to interpret this procedure using normal-order evaluation, as discussed in section 1.1.5. 
    (The normal-order-evaluation rule for if is described in exercise 1.5.) 
    Using the substitution method (for normal order), illustrate the process generated in evaluating (gcd 206 40) 
    and indicate the remainder operations that are actually performed. 
    How many remainder operations are actually performed in the normal-order evaluation of (gcd 206 40)? 
    In the applicative-order evaluation?
 |#

;1. Normal-order evaluation
(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (r 206 40)))

(if (= 40 0)
    206
    (if (= (r 206 40) 0) ; execution + 1 
        40
        (gcd (r 206 40) 
             (r 40 (r 206 40)))))

(if (= 40 0)
    206
    (if (= 6 0)
        40
        (if (= (r 40 (r 206 40)) 0) ; execution + 2
            (r 206 40)
            (gcd (r 40 
                    (r 206 40)) 
                 (r (r 206 40) 
                            (r 40 
                               (r 206 40)))))))

(if (= 40 0)
    206
    (if (= 6 0)
        40
        (if (= 4 0)
            (r 206 40)
            (if (= (r (r 206 40) 
                      (r 40 
                         (r 206 40))) ; execution + 4
                   0)
                (r 40 
                   (r 206 40))
                (gcd (r (r 206 40) 
                      (r 40 
                         (r 206 40)))
                     (r (r 40 
                           (r 206 40))
                        (r (r 206 40) 
                           (r 40 
                              (r 206 40)))))))))                            

(if (= 40 0)
    206
    (if (= 6 0)
        40
        (if (= 4 0)
            (r 206 40)
            (if (= 2 0)
                (r 40 
                   (r 206 40))
                (if (= (r (r 40 
                             (r 206 40))
                          (r (r 206 40) 
                             (r 40 
                                (r 206 40)))) ; execution + 7  
                        0)
                    (r (r 206 40) 
                       (r 40 
                          (r 206 40)))     
                    ...))))) ; rest is skipped, because it is not executed

(if (= 40 0)
    206
    (if (= 6 0)
        40
        (if (= 4 0)
            (r 206 40)
            (if (= 2 0)
                (r 40 
                   (r 206 40))
                (if (= 0 
                       0)
                    (r (r 206 40) 
                       (r 40 
                          (r 206 40))) ; execution + 4    
                    ...))))) ; rest is skipped, because it is not executed

; Remainder is executed 18 times using normal-order evaluation.

; 2. Applicative-order evaluation

(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (r 206 40))) ; execution + 1

(if (= 40 0)
    206
    (if (= 6 0)
        40
        (gcd 6 (r 40 6)))) ; execution + 1

(if (= 40 0)
    206
    (if (= 6 0)
        40
        (if (= 4 0)
            6
            (gcd 4 (r 6 4))))) ; execution + 1

(if (= 40 0)
    206
    (if (= 6 0)
        40
        (if (= 4 0)
            6
            (if (= 2 0)
                4
                (gcd 2 (r 4 2)))))) ; execution + 1

(if (= 40 0)
    206
    (if (= 6 0)
        40
        (if (= 4 0)
            6
            (if (= 2 0)
                4
                (if (= 0 0)
                    2
                    ...)))))              

; Remainder is executed 4 times using applicative-order evaluation.
