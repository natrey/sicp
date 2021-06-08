#|
  In 1737, the Swiss mathematician Leonhard Euler published a memoir `De Fractionibus Continuis`, 
  which included a continued fraction expansion for `e - 2`, where `e` is the base of the natural logarithms. 
  In this fraction, the Ni are all 1, and the Di are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, .... 
  Write a program that uses your `cont-frac` procedure from exercise 1.37 to approximate `e`, based on Euler's expansion.
 |#
(define (euler-n x)
    (cond ((= x 0) 1)
          ((= (remainder (- x 1) 3) 0) 
            (* 2 
               (+ 1 
                  (/ (- x 1) 
                     3))))
          (else 1)))

(euler-n 10) ;8
(euler-n 7)  ;6
(euler-n 2)  ;1

(define (cont-frac-iter n d k)
    (define (iter i result)
        (if (= i k)
            result
            (iter (+ i 1) (/ (n i)
                             (+ (d i)
                                result)))))
    (iter 0 0))

(cont-frac-iter (lambda (i) 1.0)
                euler-n
                11)