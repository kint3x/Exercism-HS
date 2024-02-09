module Grains (square, total) where

square_help :: Integer -> Integer
square_help 1 = 1
square_help n = 2 * square_help (n-1)

square :: Integer -> Maybe Integer
square n 
    | n < 65 && n > 0 = Just (square_help n)
    | otherwise = Nothing

total :: Integer
total = sum [square_help n | n <- [1..64]]