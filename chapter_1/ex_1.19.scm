#|
    There is a clever algorithm for computing the Fibonacci numbers in a logarithmic number of steps.
    Recall the transformation of the state variables a and b in the fib-iter process of section 1.2.2

    a ← a + b
    b ← a

    Call this transformation T, and observe that applying T over and over again n times, starting with 1 and 0, 
    produces the pair Fib(n + 1) and Fib(n). In other words, the Fibonacci numbers are produced by applying T^n, 
    the nth power of the transformation T, starting with the pair (1,0). 

    Now consider T to be the special case of p = 0 and q = 1 in a family of transformations T_pq, 
    where T_pq transforms the pair (a,b) according to a ← bq + aq + ap and b ← bp + aq. 

    Show that if we apply such a transformation T_pq twice, the effect is the same as using a single transformation T_p'q' of the same form, 
    and compute p' and q' in terms of p and q. This gives us an explicit way to square these transformations, 
    and thus we can compute T^n using successive squaring, as in the fast-expt procedure. 

    Put this all together to complete the following procedure, which runs in a logarithmic number of steps:

    (define (fib n)
        (fib-iter 1 0 0 1 n))
    (define (fib-iter a b p q count)
        (cond ((= count 0) b)
              ((even? count)
                (fib-iter a
                          b
                          <??>      ; compute p'
                          <??>      ; compute q'
                          (/ count 2)))
              (else (fib-iter (+ (* b q) (* a q) (* a p))
                              (+ (* b p) (* a q))
                              p
                              q
                              (- count 1)))))

 |#

; For case of p = 0 and q = 1 the transformation of a and b 

T(0, 1)
    a = bq + aq + ap = b1 + a1 + a0 = b + a
    b = bp + aq = b0 + a1 = b

T(p, q)
    a` = bq + aq + ap 
    b` = bp + aq

T(p`, q`)
    a`` = b`q + a`q + a`p
    b`` = b`p + a`q

; Let's first take a look at b`` and replace a` and b` with values defined in T(p, q)
    b`` = (bp + aq)p + (bq + aq + ap)q = 
        = bp^2 + apq + bq^2 + aq^2 + apq =
        = bp^2 + bq^2 + aq^2 + 2apq =
        = b(p^2 + q^2) + a(q^2 + 2pq)

; If b`  = bp + aq 
; and 
;    b`` = b(p^2 + q^2) + a(q^2 + 2pq)
; then in b`` p` = p^2 + q^2 and q` = q^2 + 2pq

; Let's take a look at a`` and replace a` and b` with values defined in T(p, q)
    a`` = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p = 
        = bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2

; Now let combine those operands to get similar equation as a` = bq + aq + ap 
    a`` = bq^2 + 2bpq + q^2 + 2apq + ap^2 + aq^2 =
        = b(q^2 + 2pq) + a(q^2 + 2pq) + a(q^2 + 2pq)

; So if a`  = bq + aq + ap 
; and
;       a`` = b(q^2 + 2pq) + a(q^2 + 2pq) + a(q^2 + 2pq)
; then in a`` p` = p^2 + q^2 and q` = q^2 + 2pq

; Values p` and q` are equal in both a`` and b``. Let's replace p` and q` in the fib procedure

(define (fib n)
        (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
    (cond ((= count 0) b)
            ((even? count)
              (fib-iter a
                        b
                        (+ (square p) (square q))
                        (+ (square q) (* 2 p q))
                        (/ count 2)))
            (else (fib-iter (+ (* b q) (* a q) (* a p))
                            (+ (* b p) (* a q))
                            p
                            q
                            (- count 1)))))
; Testing
(fib 2)
(fib-iter 1 0 0 1 2)
(fib-iter 1 0 (+ 0 1) (+ 1 0) 1)
(fib-iter (+ 0 1 1) (+ 0 1) 1 1 0) 
1

(fib 3) ; 2
(fib 4) ; 3
(fib 5) ; 5
(fib 6) ; 8
(fib 8) ; 21

