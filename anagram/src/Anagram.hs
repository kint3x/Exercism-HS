module Anagram (anagramsFor) where
import Data.Char (toUpper)
import Data.List (sort)

areSame :: String -> String -> Bool
areSame [] [] = True
areSame _ [] = False
areSame [] _ = False
areSame (x:xs) (y:ys) 
   | x == y = areSame xs ys
   | otherwise = False

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = [ x  | x <- xss, isAnagram xs x , not (areSame (map toUpper xs) (map toUpper x))]
    where 
        isAnagram word candidate =  areSame (sort (map toUpper word)) (sort (map toUpper candidate)) 

