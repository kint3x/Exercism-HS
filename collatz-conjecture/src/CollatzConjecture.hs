module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz num
    | num <= 0 = Nothing
    | num == 1 = Just 0
    | even num  = fmap (+1) (collatz (num `div` 2))
    | otherwise = fmap (+1) (collatz (num * 3 + 1))