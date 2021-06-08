#|
  A continued fraction representation of the tangent function was published in 1770 by the German mathematician J.H. Lambert:
  
  tg x = x / 
        (1 - (x^2 / 
             (3 - (x^2 / 
                  (5 - ... ))))

  where `x` is in radians. Define a procedure (tan-cf x k) that computes an approximation to the tangent function based on Lambert's formula. 
  `K` specifies the number of terms to compute, as in exercise 1.37.      
|#
(define (lambert-n n)
    (- (* n 2.0) 1))

(lambert-n 1) ;1
(lambert-n 2) ;3
(lambert-n 3) ;5

(define (cont-frac-iter n d k) 
    (define (iter i result)
        (if (= i 0)
            result
            (iter (- i 1) (/ (n i)
                             (- (d i)
                                result)))))
    (iter k (/ (n k) (d k))))

(define (tan-cf-iter x k)
    (cont-frac-iter (lambda (i) (if (= i 1) x (* x x)))
                    lambert-n
                    k))

(tan-cf-iter 1.0 8)
;Value: 1.557407724654908

; Comparing to build-in tangent procedure
(display (tan 1.0)) 
;Value: 1.557407724654902
