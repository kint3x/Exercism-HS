module Minesweeper (annotate) where

annotate :: [String] -> [String]
annotate board = [ process xs | xs <- board]
    where
        process xs = [ updateBlanks x | x <- xs ]
        updateBlanks x 
            | x == ' ' = '1'
            | x == '*' = '*'
            | otherwise = '?'
           
