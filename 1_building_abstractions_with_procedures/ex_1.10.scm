#|
    The following procedure computes a mathematical function called Ackermann's function.

    (define (A x y)
        (cond ((= y 0) 0)
              ((= x 0) (* 2 y))
              ((= y 1) 2)
              (else (A (- x 1)
                       (A x (- y 1))))))

    What are the values of the following expressions?
    1.1 (A 1 10)
    1.2 (A 2 4)
    1.3 (A 3 3)

    Consider the following procedures, where A is the procedure defined above:
    2.1 (define (f n) (A 0 n))
    2.2 (define (g n) (A 1 n))
    2.3 (define (h n) (A 2 n))
    2.4 (define (k n) (* 5 n n))

    Give concise mathematical definitions for the functions computed by the procedures f, g, 
    and h for positive integer values of n. For example, (k n) computes 5n^2.
 |#

; 1.1
(A 1 10)    
(A 0 (A 1 9))
(A 0 (A 0 (A 1 8)))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
; 2^10 = 1024 ; result

; 1.2
(A 1 (A 2 3))
(A 1 (A 1 (A 1 (A 2 1)))) 
(A 1 (A 1 (A 1 2))) 
(A 1 (A 1 (A 0 (A 1 1))))
(A 1 16)
(A 0 (A 1 15)) ; expand 16 times
; 2^16 = 65536 ; result

; 1.3
(A 2 4)
; 2^16 = 65536 ; result

; 2.1
;(f n) computes 2*n

; 2.2
;(g n) if n = 0 result is 0, else if n > 0 result is 2^n 

; 2.3
;(h n) if n = 0 result is 0, else if n = 1 result is 2, else if n > 1 result is 2^(2^(... continue (n - 1) times))


