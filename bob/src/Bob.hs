module Bob (responseFor) where
import Data.Char

responseFor :: String -> String
responseFor xs 
    | (isYelling (filter (not . isSpace) xs)) && (isQuestion (filter (not . isSpace) xs)) = "Calm down, I know what I'm doing!"
    | (isYelling (filter (not . isSpace) xs)) = "Whoa, chill out!"
    | (isQuestion (filter (not . isSpace) xs)) = "Sure."
    | (isSilence (filter (not . isSpace) xs)) = "Fine. Be that way!"
    | otherwise = "Whatever."

isQuestion :: String -> Bool
isQuestion [] = False
isQuestion text = (elem '?' [(last text)])

onlyLetters :: String -> String
onlyLetters text = foldr (\x acc -> if(isLetter x) then( [x]++acc ) else( acc ) ) [] text 

hasLetters :: String -> Bool
hasLetters text = foldr(\x acc -> if(isLetter x) then( acc||True) else (acc) ) False text

isYelling :: String -> Bool
isYelling text = foldr (\x acc -> if(isLetter x) then ((isUpper x)&&acc) else (acc) ) (hasLetters text) (onlyLetters text)
 
isSilence :: String -> Bool
isSilence [] = True
isSilence text = foldr(\x acc-> acc && (isSpace(x)) ) True text




