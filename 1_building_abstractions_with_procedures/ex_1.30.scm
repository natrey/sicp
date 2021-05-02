#|
    The `sum` procedure above generates a linear recursion. 
    The procedure can be rewritten so that the sum is performed iteratively. 
    Show how to do this by filling in the missing expressions in the following definition:

    (define (sum term a next b)
        (define (iter a result)
            (if <??>
                <??>
                (iter <??> <??>)))
        (iter <??> <??>))
 |#

(define (sum term a next b)
        (define (iter a result)
            (if (> a b)
                result
                (iter (next a) (+ (term a) 
                                  result))))
        (iter a 0))

;test from previous exercise

(define (cube x) (* x x x))

(define (next-counter c) (+ 1 c))

(define (simpson-integral f a b n)
    (define h
        (/ (- b a) n))
    (define (y k)
        (f (+ a 
              (* h k))))

    (define (calc-term k)
        (* (cond ((or (= k n) (= k 0)) 1)
              ((even? k) 2)
              (else 4))
           (y k)))

    (* (sum calc-term 0 next-counter n)
       (/ h 3)))

(simpson-integral cube 0 1 100) ; 1/4
(simpson-integral cube 0 1 1000) ; 1/4