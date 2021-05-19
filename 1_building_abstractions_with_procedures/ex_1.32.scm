#|
    a. Show that `sum` and `product` (exercise 1.31) are both special cases of a still more general notion called `accumulate`
    that combines a collection of terms, using some general accumulation function:

    (accumulate combiner null-value term a next b)

    `Accumulate` takes as arguments the same term and range specifications as `sum` and `product`, 
    together with a `combiner` procedure (of two arguments) that specifies how the current term 
    is to be combined with the accumulation of the preceding terms and a null-value that specifies
     what base value to use when the terms run out. 
    Write accumulate and show how `sum` and `product` can both be defined as simple calls to `accumulate`.

    b. If your `accumulate` procedure generates a recursive process, write one that generates an iterative process. 
    If it generates an iterative process, write one that generates a recursive process.
 |#

;a.
(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a)
                  (accumulate combiner null-value term (next a) next b))))

; test factorial evaluation
(define (identity x) x)

(define (inc n) (+ n 1))

(define (multiply x y) (* x y))

(define (factorial n)
    (accumulate multiply 1 identity 1 inc n))

(factorial 3) ;6
(factorial 5) ;120

; test sum of cubes
(define (addition x y) (+ x y))

(define (cube x) (* x x x))

(define (sum-cubes a b)
    (accumulate addition 0 cube a inc b))

(sum-cubes 1 10) ;3025

;b.
(define (accumulate-iter combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (combiner (term a)
                              result))))
    (iter a null-value))

; test factorial evaluation
(define (factorial-iter n)
    (accumulate-iter multiply 1 identity 1 inc n))

(factorial-iter 3)
(factorial-iter 5)

; test sum of cubes
(define (sum-cubes-iter a b)
    (accumulate-iter addition 0 cube a inc b))

(sum-cubes-iter 1 10) ;3025