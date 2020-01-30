-- Lecture 3: Defining Functions

--Haskell uses conditional expressions
--ex.
abs :: Int -> Int
abs n = if n >= 0 then n else -n

--Goal is for the condition to be Total, meaning it won't crash if a disagreeable input is received
--The program must always have an else statement at the end of the conditional

signum :: Int -> Int

signum n = if n < 0 then -1 else
              if n == 0 then 0 else 1

--Haskell supports nested conditionals, ex. above

--Guards are good alternatives to conditional functions ex.

abs :: Int -> Int

abs n | n >= 0 = n
      | otherwise = -n

--The above function is equal to the first one of the Lecture
-- otherwise is defined in prelude where it is always equal to True

--Could make a truth table

(&&) :: Bool -> Bool -> Bool

--Compact definition of a truth table

True && True = True
_ && _ = False

--Modification that makes a more efficient form
True && b = b
False && _ = False

--The underscore is called a wildcard and represents any argument value
--Patterns are applied top to bottom, but that seems fairly self explanatory

--Patterns cant repeat variables (wildcards can be repeated)

b && b = b
_ && _ = False
--The above snippet would give an error

{- Every non empty list uses an operator called `cons` (:) which adds elements to the list
[1,2,3,4] really means 1:(2:(3:(4:[])))
-}

{- `Head` and `Tail` are two non-total functions, don't really use them and pattern match instead-}

--(x:xs) patterns match non-empty lists only
-- head [] gives an exception because the list is empty!

{-anonymous expressions can be constructed with lambda expressions-}

\x -> x+x
--nameless function that takes x and doubles it
--useful for functions you might only use once

--in the prelude it would look like:
--(\x = x+x) 21

{- 3 parts to a recursive function: Must have a base case, must call itself, must call itself with a new value closer to the base case than the previous call}

--Factorial function would look like:

factorial :: Num a => a -> a
factorial 0 = 1
factorial n = n * factorial(n-1)

--a better implementation would be

factorial2 n = product [1..n]

--Lots of recursion on functions with Lists

product ::[Int] -> Int
product [] = 1
product (n:ns) = n * product ns

--the above function looks like the below

{- product [2,3,4]
= 2 * product [3,4]
= 2 * (3 * product [4])
= 2 * (3 * (4 * product []))
= 2 * (3 * (4 * 1))
= 24 -}
