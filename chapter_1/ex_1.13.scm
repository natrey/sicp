#|
    Prove that Fib(n) is the closest integer to 𝝓^n/√5, where 𝝓 = (1 + √5)/2. 
    Hint: Let 𝝍 = (1 - √5)/2. Use induction and the definition of the Fibonacci numbers to prove that Fib(n) = (𝝓^n - 𝝍^n)/√5.
 |#

#|
    Mathematical induction is a mathematical proof technique. 
    It is essentially used to prove that a statement P(n) holds for every natural number n = 0, 1, 2, 3,...; 
    A proof by induction consists of two cases.
    The first, the base case (or basis), proves the statement for n = 0 without assuming any knowledge of other cases. 
    The second case, the induction step, proves that if the statement holds for any given case n = k, then it must also hold for the next case n = k + 1.
    These two steps establish that the statement holds for every natural number n.

    Ref: https://en.wikipedia.org/wiki/Mathematical_induction

    1. Proof of statement for n = 0. 
    
    Fib(n) = 0;

    (((1 + √5)/2)^0) / √5 = 1 / √5 ≈ 0.447;

    Closest natural number to 0.447 is 0.

    2. Proof of statement for n = 1.

    Fib(n) = 1;

    (((1 + √5)/2)^1) / √5 = ((1 + √5)/2) / √5 ≈ 1.61 / 2.236 ≈ 0.72;

    Closest natural number to 0.72 is 1.

    3. Proof of statement for n = k + 1.
    
    The definition of the Fibonacci numbers states that 

    Fib(n) = Fib(n-1) + Fib(n-2); (1)

    If Fib(n) = (𝝓^n - 𝝍^n)/√5 then Fib(n-1) = (𝝓^(n-1) - 𝝍^(n-1))/√5 and Fib(n-2) = (𝝓^(n-2) - 𝝍^(n-2))/√5,

    so equation (1) should be true as well for

    (𝝓^n - 𝝍^n)/√5 = (𝝓^(n-1) - 𝝍^(n-1))/√5 + (𝝓^(n-2) - 𝝍^(n-2))/√5;


    Let's transform the right part of equation. 

    1/√5 ((𝝓^(n-1) - 𝝍^(n-1) + 𝝓^(n-2) - 𝝍^(n-2)) = 

    1/√5 (𝝓^(n-1) + 𝝓^(n-2) - (𝝍^(n-1) + 𝝍^(n-2))) =

    1/√5 (𝝓^(n-2)(𝝓 + 1) - 𝝍^(n-2)(𝝍 + 1)) 


    If 𝝓 = (1 + √5)/2, then 
    
    𝝓 + 1 = (1 + √5)/2 + 1 = (1 + √5)/2 + 2/2 = (3 + √5)/2 = (6 + 2√5)/4 = (1 + 2√5 + 5)/4 = ((1 + √5)/2)^2 = 𝝓^2

    and similar if 𝝍 = (1 - √5)/2, then

    𝝍 + 1 = (1 - √5)/2 + 1 = ((1 - √5)/2)^2 = 𝝍^2


    Let's return to the transformation of the right part 

    1/√5 (𝝓^(n-2)(𝝓 + 1) - 𝝍^(n-2)(𝝍 + 1)) = 1/√5 (𝝓^(n-2)𝝓^2 - 𝝍^(n-2)𝝍^2) = 1/√5 (𝝓^n - 𝝍^n)

    So right part is equal to left part prooving that Fib(n) = (𝝓^n - 𝝍^n)/√5. (2)

    
    Let's use equation (2) to prove that 𝝓^n/√5 is the closest integer to Fib(n).

    𝝓^n/√5 = Fib(n) + 𝝍^n/√5

    Fib(n) is a natural number, so let's take a closer look at 𝝍^n/√5.

    𝝍 = (1 - √5)/2 ≈ -0.62;

    If n = 0, 𝝍^n = 1,

    if n > 0 then 
    1    > 𝝍^n    > -1, 
    1/√5 > 𝝍^n/√5 > -1/√5 
    1/2  > 𝝍^n/√5 > -1/2.

    This leads to  Fib(n) + 1/2 > 𝝓^n/√5 > -1/2 + Fib(n) and proves that 𝝓^n/√5 is the closest integer to Fib(n).
 |#
 