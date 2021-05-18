#|
    a. The `sum` procedure is only the simplest of a vast number of similar abstractions 
    that can be captured as higher-order procedures.
    Write an analogous procedure called `product` that returns the product of the values of a function at points over a given range.
    Show how to define `factorial` in terms of `product`. Also use `product` to compute approximations to using the formula
    
    𝛑/4 = (2*4*4*6*6*8...)/(3*3*5*5*7*7...)

    b.  If your `product` procedure generates a recursive process, write one that generates an iterative process. 
    If it generates an iterative process, write one that generates a recursive process.
 |#

;a.
(define (product term a next b)
    (if (> a b)
        1
        (* (term a)
           (product term (next a) next b))))

(define (inc n) (+ n 1))

(define (identity x) x)

(define (factorial n)
    (product identity 1 inc n))

(factorial 3) ;6
(factorial 5) ;120

(define (square x) (* x x))

(define (pi-product a b)
    (define (pi-term x)
        (/ (* 1.0 x (+ x 2))
           (square (+ x 1))))
    (define (pi-next x)
        (+ x 2))
    (product pi-term a pi-next b))

(* 4 (pi-product 2 100)) ;3.157030176455167
(* 4 (pi-product 2 1000)) ;3.1431607055322752

;b.
(define (product-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* (term a)
                              result))))
    (iter a 1))

(define (pi-product-iter a b)
    (define (pi-term x)
        (/ (* 1.0 x (+ x 2))
           (square (+ x 1))))
    (define (pi-next x)
        (+ x 2))
    (product-iter pi-term a pi-next b))

(* 4 (pi-product-iter 2 100)) ;3.1570301764551667
(* 4 (pi-product-iter 2 1000)) ;3.1431607055322752

