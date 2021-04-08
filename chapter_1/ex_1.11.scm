#|
    A function f is defined by the rule that f(n) = n if n < 3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3.
    1. Write a procedure that computes f by means of a recursive process. 
    2. Write a procedure that computes f by means of an iterative process.
 |#

;1. Recursive process
(define (f n)
    (if (< n 3) 
        n
        (+ (f (- n 1))
           (* 2 (f (- n 2)))
           (* 3 (f (- n 3))))))

#|
(f 4)

(+ (f 3) (* 2 (f 2)) (* 3 (f 1)))

2(+ (+ (f 2) (* 2 (f 1)) (* 3 (f 0)))
   (* 2 2) 
   (* 3 1))

(+ (+ 2 (* 2 1) (* 3 0))
   (* 2 2) 
   (* 3 1))

(+ 4
   4 
   3)

11 result
 |#

;2. Iterative process
(define (f n)
    (f-iter 2 1 0 n))

(define (f-iter a b c count)
    (cond ((= count 2) a)
          ((= count 1) b)
          ((= count 0) c)
          (else (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1)))))

#|
(f 4)

(f-iter 2 1 0 4)

(f-iter (+ 2 (* 2 1) (* 3 0)) 2 1 3) =>
(f-iter 4 2 1 3)

(f-iter (+ 4 (* 2 2) (* 3 1)) 4 2 2) =>
(f-iter 11 4 2 2)

11 result
 |#