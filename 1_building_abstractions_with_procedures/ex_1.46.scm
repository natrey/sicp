#|
    Several of the numerical methods described in this chapter are instances of an extremely general computational strategy known as `iterative improvement`.
    Iterative improvement says that, to compute something, we start with an initial guess for the answer, 
    test if the guess is good enough, and otherwise improve the guess and continue the process using the improved guess as the new guess.  
    
    a. Write a procedure `iterative-improve` that takes two procedures as arguments: a method for telling whether a guess is good enough and a method for improving a guess.
    `Iterative-improve` should return as its value a procedure that takes a guess as argument and keeps improving the guess until it is good enough.  
    
    b. Rewrite the `sqrt` procedure of section 1.1.7 and the `fixed-point` procedure of section 1.3.3 in terms of `iterative-improve`.
|#

;a.
(define (iterative-improve good-enough? improve-guess)
    (define (iter-guess guess)
        (if (good-enough? guess)
            guess
            (iter-guess (improve-guess guess))))
    (lambda (guess) (iter-guess guess)))

;b. 
(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
    (define (good-enough-sqrt? guess)
        (< (abs (- (square guess) x)) 0.001))

    (define (improve-sqrt guess)
        (average guess (/ x guess)))

    ((iterative-improve good-enough-sqrt? improve-sqrt) 1.0))

(sqrt 4)
;Value: 2.0000000929222947

(sqrt 64)
;Value: 8.000001655289593


(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (fixed-point f first-guess)
    (define (close-enough? guess)
        (define next-guess (f guess))
        (< (abs (- guess next-guess)) tolerance))

    (define (improve-guess guess)
        (f guess))

    ((iterative-improve close-enough? improve-guess) first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x)))
             1.0)
;Value: 1.6180371352785146

(fixed-point (lambda (x) (/ (log 1000) (log x)))
             2.0)
;Value: 4.555540912917957 