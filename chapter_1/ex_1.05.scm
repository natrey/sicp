#|
    Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. 
    He defines the following two procedures:

    (define (p) (p))

    (define (test x y)
        (if (= x 0)
            0
            y))

    Then he evaluates the expression

    (test 0 (p))

    1. What behavior will Ben observe with an interpreter that uses applicative-order evaluation? 
    2. What behavior will he observe with an interpreter that uses normal-order evaluation? 
    Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: 
    The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)

    Answer:

    1. The interpreter first evaluates the operator and operands and then applies the resulting procedure to the resulting arguments.
    First the body of test is retrieved. 
    (if (= x 0)
        0
        y)
    Then arguments 0 and p are evaluated first before replacing x and y parameters. 
    Trying to evaluate p will lead to an infinite loop and the test will not be invoked.
    
    2.
    First the body of test is retrieved. 
    (if (= x 0)
        0
        y)
    Then parameters x, y are replaced by arguments 0 and p without evaluation.
    (if (= 0 0)
        0
        p)
    The predicate expression "if" is evaluated as true and 0 is returned. Thus p will not be called.
 |#