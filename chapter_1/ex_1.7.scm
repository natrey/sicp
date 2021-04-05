#|
    The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. 
    Also, in real computers, arithmetic operations are almost always performed with limited precision. 
    This makes our test inadequate for very large numbers. Explain these statements, 
    with examples showing how the test fails for small and large numbers. 
    
    An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next 
    and to stop when the change is a very small fraction of the guess. 
    Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

    Answer:
    (sqrt 0.0001) returns 0.03230844833048122 instead of 0.01.
    (sqrt 12345678901234) hangs in execution instead of returning 3513641,8288200.

    Alternative implementation of good-enough:
 |#

(define (sqrt x)
  (sqrt-iter 1.0 0 x))

(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))

(define (good-enough? guess prev-guess)
  (< (abs (- guess prev-guess)) (/ prev-guess 1000)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; Yes, this procedure works better for large and small numbers.
; (sqrt 0.0001) returns 0.010000000025490743
; (sqrt 12345678901234) returns 3513641.86446291