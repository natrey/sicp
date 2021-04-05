#|
    Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, 
    then a better approximation is given by the value

    (x/y^2 + 2y) / 3

    Use this formula to implement a cube-root procedure analogous to the square-root procedure.
 |#

(define (cbrt x)
  (cbrt-iter 1.0 0 x))

(define (cbrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (cbrt-iter (improve guess x)
                 guess
                 x)))

(define (improve guess x)
  (third (+ (/ x (square guess))
            (* 2 guess))))

(define (third val)
  (/ val 3))

(define (square x) (* x x))

(define (good-enough? guess prev-guess)
  (< (abs (- guess prev-guess)) 
     (/ prev-guess 1000)))

; (cbrt 1000) => 10.000000145265767