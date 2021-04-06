#|
    Each of the following two procedures defines a method for adding two positive integers in terms of the procedures inc,
     which increments its argument by 1, and dec, which decrements its argument by 1.

    (define (+ a b)
        (if (= a 0)
            b
            (inc (+ (dec a) b))))

    (define (+ a b)
        (if (= a 0)
            b
            (+ (dec a) (inc b))))

    Using the substitution model, illustrate the process generated by each procedure in evaluating (+ 4 5). 
    Are these processes iterative or recursive?
 |#

; Substitution model for procedure 1:
; 1. Retrieve the body of procedure and replace parameters with arguments
    (if (= 4 0)
        5
        (inc (+ (dec 4) 5)))

; 2. Evaluate the operand (dec 4)
    (if (= 4 0)
        5
        (inc (+ 3 5)))

; 3. Evaluate (+ 3 5) as defined by procedure 1
    (if (= 3 0)
        5
        (inc (+ 2 5))) ; result

; 4. Substitute (+ 3 5) with result (inc (+ 2 5))
    (inc (inc (+ 2 5)))

; 5. Evaluate (+ 2 5) and substitute with result
    (if (= 2 0)
        5
        (inc (+ 1 5))) ; result

    (inc (inc (inc (+ 1 5))))

; 6. Evaluate (+ 1 5) and substitute with result
    (if (= 1 0)
        5
        (inc (+ 0 5))) ; result

    (inc (inc (inc (inc (+ 0 5)))))

; 7. Evaluate (+ 0 5) and substitute with result
    (if (= 0 0)
        5 ; result
        (inc (+ (- 0 1) 5))) 

    (inc (inc (inc (inc 5))))

; 8. Evaluate inc procedures
    (inc (inc (inc 6)))
    (inc (inc 7))
    (inc 8)
    9

; This is a recursive process.

; Substitution model for procedure 2:
; 1. Retrieve the body of procedure and replace parameters with arguments
    (if (= 4 0)
        5
        (+ (dec 4) (inc 5)))

; 2. Evaluate the operands (dec 4) and (inc 5)
    (if (= 4 0)
        5
        (+ 3 6))

; 3. Evaluate (+ 3 6) as defined by procedure 2
    (if (= 3 0)
        3
        (+ 2 7)) ;result

; 4. Substitute (+ 3 6) with result (+ 2 7)
    (+ 2 7)

; 5. Evaluate (+ 2 7) and substitute with result
    (if (= 2 0)
        7
        (+ 1 8)) ;result

; 6. Evaluate (+ 1 8) and substitute with result
    (if (= 1 0)
        8
        (+ 0 9)) ;result

; 7. Evaluate (+ 0 9) and substitute with result
    (if (= 0 0)
        9 ;result
        (+ (- 0 1) 10)) 

; This is an iterative process.