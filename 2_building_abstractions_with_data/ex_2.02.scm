#|
     Consider the problem of representing line segments in a plane. 
     Each segment is represented as a pair of points: a starting point and an ending point. 
     Define a constructor `make-segment` and selectors `start-segment` and `end-segment` 
     that define the representation of segments in terms of points. 
     Furthermore, a point can be represented as a pair of numbers: the `x` coordinate and the `y` coordinate. 
     Accordingly, specify a constructor `make-point` and selectors `x-point` and `y-point` that define this representation. 
     Finally, using your selectors and constructors, define a procedure `midpoint-segment` that takes a line segment as argument 
     and returns its midpoint (the point whose coordinates are the average of the coordinates of the endpoints).
     
     To try your procedures, you'll need a way to print points: 

    (define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))
|#

(define (make-segment start-point end-point)
    (cons start-point end-point))

(define (start-segment segment)
    (car segment))

(define (end-segment segment)
    (cdr segment))

(define (make-point x y)
    (cons x y))

(define (x-point point)
    (car point))

(define (y-point point)
    (cdr point))

(define (midpoint-segment segment)
    (define (midpoint term start end)
        (/ (+ (term start) 
              (term end))
            2))
    (let ((start-point (start-segment segment))
          (end-point (end-segment segment)))
          (make-point (midpoint x-point start-point end-point)
                      (midpoint y-point start-point end-point))))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

;test
(let ((test-segment (make-segment (make-point 1.0 1.0)
                                  (make-point 9.0 9.0))))
     (print-point (midpoint-segment test-segment)))
;(5.,5.)




                      