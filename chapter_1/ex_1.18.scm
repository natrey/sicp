#|
    Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative process 
    for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.
|#

(define (* a b)
    (multiply-iter a b 0))

(define (multiply-iter a b product)
    (cond ((= b 0) product)
          ((= a 0) product)
          ((= (even? b) 0) (multiply-iter (double a) (halve b) product))
          (else (multiply-iter a (- b 1) (+ product a)))))

(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (even? n) 
  (cond ((= n 0) 0)
        ((= n 1) 1)
        ((< n 0) 1)
        (else (even? (- n 2)))))

; (* 3 4) 12