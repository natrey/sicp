#|
    Show that the golden ratio 𝝓 (section 1.2.2) is a fixed point of the transformation x ⟼ 1 + 1/x, 
    and use this fact to compute 𝝓 by means of the `fixed-point` procedure.
 |#

; A number x is called a fixed point of a function f if x satisfies the equation f(x) = x. 
; Thus, the transformation x ⟼ 1 + 1/x is should satisfy the equation

; x = 1 + 1/x or 
; x - 1/x - 1 = 0 // we can multiply by x and calculate roots of a squared equation.
; x^2 - x - 1 = 0

; Roots:
; x1 = (1 + √(1^2 + 4*1*1))/2
; x1 = (1 + √5)/2
; x2 = (1 - √5)/2

; x1 equals the value of 𝝓 (section 1.2.2).

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

(fixed-point (lambda (x) (+ 1 (/ 1 x)))
             1.0)
;Value: 1.6180327868852458