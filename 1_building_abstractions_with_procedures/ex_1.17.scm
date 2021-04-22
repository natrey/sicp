#|
    The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication. 
    In a similar way, one can perform integer multiplication by means of repeated addition. 
    The following multiplication procedure (in which it is assumed that our language can only add, not multiply) is analogous to the expt procedure:

    (define (* a b)
        (if (= b 0)
            0
            (+ a (* a (- b 1)))))

    This algorithm takes a number of steps that is linear in b. Now suppose we include, together with addition, operations double, 
    which doubles an integer, and halve, which divides an (even) integer by 2. 
    Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic number of steps.
 |#

(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (even? n) 
  (cond ((= n 0) 0)
        ((= n 1) 1)
        ((< n 0) 1)
        (else (even? (- n 2)))))

(define (* a b) 
    (cond ((= b 0) 0)
          ((= a 0) 0)
          ((= (even? b) 0) (* (double a) (halve b)))
          (else (+ a (* a (- b 1))))))

; multiply procedure with linear number of steps
; (* 2 8) 16
; (+ 2 (* 2 7))
; (+ 2 (+ 2 (* 2 6)))
; (+ 2 (+ 2 (+ 2 (+ 2 (+ 2 (+ 2 (+ 2 (+ 2 (* 2 0)))))))))

; multiply procedure with logarithmic number of steps
; (* 2 8) 16
; (* 4 4)
; (* 8 2)
; (+ 16 (* 16 0))
