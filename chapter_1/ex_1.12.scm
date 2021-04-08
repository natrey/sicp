#|
    The following pattern of numbers is called Pascal's triangle.

        1
       1 1
      1 2 1
     1 3 3 1
    1 4 6 4 1

    The numbers at the edge of the triangle are all 1, 
    and each number inside the triangle is the sum of the two numbers above it.
    Write a procedure that computes elements of Pascal's triangle by means of a recursive process.
 |#

 (define (pascal-element row column)
    (cond ((= row column) 1)
          ((= column 0) 1)
          (else (+ (pascal-element (- row 1) column) 
                   (pascal-element (- row 1) (- column 1))))))

; (pascal-element 0 0) => 1
; (pascal-element 1 1) => 1
; (pascal-element 2 1) => 2
; (pascal-element 3 2) => 3
; (pascal-element 4 3) => 4
; (pascal-element 4 2) => 6