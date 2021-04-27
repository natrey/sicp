#|
    Louis Reasoner is having great difficulty doing exercise 1.24. His `fast-prime?` test seems to run more slowly than his `prime?` test. 
    Louis calls his friend Eva Lu Ator over to help. When they examine Louis's code, 
    they find that he has rewritten the `expmod` procedure to use an explicit multiplication, rather than calling square:

    (define (expmod base exp m)
        (cond ((= exp 0) 1)
              ((even? exp)
                (remainder (* (expmod base (/ exp 2) m)
                              (expmod base (/ exp 2) m))
                           m))
              (else
                (remainder (* base (expmod base (- exp 1) m))
                           m))))

    "I don't see what difference that could make," says Louis. "I do." says Eva.
    "By writing the procedure like that, you have transformed the O(log n) process into a O(n) process." Explain.
 |#

;Let's compare two variations for exp equals 8:

;Original procedure
(square (expmod base (/ 8 2) m))
(square (square (expmod base (/ 4 2) m)))
(square (square (square (expmod base (/ 2 2) m))))
;square is executed log2 8 = 3 times, so the order of growth is O(log n).

;Hugo's variation
(* (expmod base (/ 8 2) m)
   (expmod base (/ 8 2) m))

(* (* (expmod base (/ 4 2) m)
      (expmod base (/ 4 2) m))
   (* (expmod base (/ 4 2) m)
      (expmod base (/ 4 2) m)))

(* (* (* (expmod base (/ 2 2) m)
         (expmod base (/ 2 2) m))
      (* (expmod base (/ 2 2) m)
         (expmod base (/ 2 2) m)))
   (* (* (expmod base (/ 2 2) m)
         (expmod base (/ 2 2) m))
      (* (expmod base (/ 2 2) m)
         (expmod base (/ 2 2) m))))
;The number of executions increases each time by 2, in this case it's 2^3, 
;in general it's 2^n and proportional to number of steps, so the order of growth is linear O(n).
