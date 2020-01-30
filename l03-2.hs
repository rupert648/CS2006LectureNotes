--Lecture 3. Defining Functions

--then else
abs :: Int -> Int
abs n = if n >= 0 then n else -n

--nested then else
signum :: Int -> Int
signum n = if n < 0 then -1 else
  if n == 0 then 0 else 1

--else is always needed

--GUARDED EQUATIONS
guard :: Int -> Int
guard n | n >= 0 = n
        | otherwise = -n
--same as the first function

--Guarded example 2 (same as second nested equation)
guard2 :: Int -> Int
guard2 n | n < 0 = -1
        | n == 0 = 0
        | otherwise = 1

--Can use guarded equations for pattern matches
--e.g &&
(&&) :: Bool -> Bool -> Bool
True && True = True
True && False = False
False && True = False
False && False = False
--But this can be defined more compactly using
True && True = True
_ && _ = False
--where '_' means "anything but True and True"

--However we can make this even more efficient by using the following
True && b = b
False && _ = False
--This is because if it sees False at the start there is no need to look at the second bool.
--IMPORTANT--
--PATTERNS ARE MATCHED IN ORDER
{-
_ && _ = False
True && True = True
-}
--this always returns False as the first pattern is checked first


--LIST PATTERNS
--Lists are constructed using a repeat of the (:) constructor
-- (:) :: a -> [a] -> [a]
-- So [1,2,3,4] really means 1:(2:(3:(4:[]))).

--Functions on lists can be defined using patterns of the form (x:xs)
--(x:xs) only matches non-empty Lists
{-e.g. "head []" will return:
      *** Exception: Prelude.head: empty list-}



--LAMBDA EXPRESSIONS
-- "\x -> x+x"

{-e.g.
  (\x -> x+x) 21  -}

{-
add x y = x + y
. . . really means . . .
add = \ x -> (\ y -> x + y)
-}
--Mainly used when you want to avoid naming a function which you are only going to use once


--RECURSIVE FUNCTIONS
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n* factorial (n-1)
