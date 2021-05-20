#|
You can obtain an even more general version of `accumulate` (exercise 1.32) by introducing the notion of a `filter` on the terms to be combined.
That is, combine only those terms derived from values in the range that satisfy a specified condition.
The resulting `filtered-accumulate` abstraction takes the same arguments as accumulate, 
together with an additional predicate of one argument that specifies the filter. Write `filtered-accumulate` as a procedure. 

Show how to express the following using `filtered-accumulate`:
a. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a `prime?` predicate already written)
b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).
 |#

;a.
(define (filtered-accumulate combiner filter null-value term a next b)
    (define (iter a result)
        (cond ((> a b) result)
              ((filter a b) (display " ") (display a) (iter (next a) (combiner (term a) result)))
              (else (iter (next a) result))
            ))
    (iter a null-value))

(define (prime? n m)
    (= n (smallest-divisor n)))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
    (= (remainder b a) 0))

(define (square x) (* x x))

(define (inc n) (+ n 1))

(define (addition x y) (+ x y))

(define (sum-prime-squares a b)
    (filtered-accumulate addition prime? 0 square a inc b))

(sum-prime-squares 1 10) ;88
(sum-prime-squares 1 100) ;65797

;b.
(define (identity x) x)

(define (multiply x y) (* x y))

(define (gcd a b)
        (if (= b 0)
            a
            (gcd b (remainder a b))))

(define (gcd-prime? a b)
    (= (gcd a b) 1))

(define (product-prime n)
    (filtered-accumulate multiply gcd-prime? 1 identity 1 inc n))

(product-prime 10) ;189
(product-prime 42) ;181101347337625


