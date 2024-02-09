module Pangram (isPangram) where
import Data.Char
import Data.List

alphabet = ['a', 'b', 'c', 'd', 'e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v', 'x', 'y', 'z']

--isPangram :: String -> Bool
isPangram text =  isAllInAlphabet (removeAllOthers (toUniqe text))

toUniqe text = nub (map toLower text)

removeAllOthers text = foldr (\x acc -> if(x `elem` alphabet) then( x:acc) else(acc) ) [] text

isAllInAlphabet text = foldr (\x acc -> (x `elem` text)&&acc ) True alphabet