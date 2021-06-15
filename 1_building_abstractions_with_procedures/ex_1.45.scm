#|
    We saw in section 1.3.3 that attempting to compute square roots by naively finding a fixed point of y ⟼ x/y does not converge, 
    and that this can be fixed by average damping. 
    The same method works for finding cube roots as fixed points of the average-damped y ⟼ x/y^2.
    Unfortunately, the process does not work for fourth roots -- a single average damp is not enough to make a fixed-point search for y ⟼ x/y^3 converge.
    On the other hand, if we average damp twice (i.e., use the average damp of the average damp of y ⟼ x/y^3) the fixed-point search does converge.
    
    a. Do some experiments to determine how many average damps are required to compute nth roots as a fixed-point search based upon repeated average damping of y ⟼ x/y^(n-1).
    b. Use this to implement a simple procedure for computing nth roots using `fixed-point`, `average-damp`, and the `repeated` procedure of exercise 1.43.
    Assume that any arithmetic operations you need are available as primitives. 
|#

(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeated f n)
    (define (iter i result)
        (if (= i 1)
            result
            (iter (- i 1) (compose f result))))
    (iter n f))

(define tolerance 0.00001)

(define (average x y)
  (/ (+ x y) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

;a.
;It takes minimum (log2 n) times to repeat average dumping of y ⟼ x/y^(n-1). 

;b. 

(define (pow x n)
    (if (= n 1)
        x
        (* x (pow x (- n 1)))))

(define (log2 x) (/ (log x) (log 2)))

(define (nth-root x n)
    (fixed-point ((repeated average-damp (floor (log2 n)))  
                  (lambda (y) (/ x (pow y (- n 1))))) 
                 1.0))
; (floor (log2 n)) evaluates log of n based on 2 and rounds it to lower or equal integer value.

(nth-root 625 5)
;Value: 3.623896628246267

(nth-root 25 2)
;Value: 5

(nth-root 64 3)
;Value: 3.9999968907104337