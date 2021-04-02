#|
    Observe that our model of evaluation allows for combinations whose operators are compound expressions. 
    Use this observation to describe the behavior of the following procedure:

    (define (a-plus-abs-b a b)
        ((if (> b 0) + -) a b))

    Answer: 
    If b is greater than 0 then the value of prefix operator is + and the sum of a and b is returned, 
    else the substruction of a and b is returned.
|#