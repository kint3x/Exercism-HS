module Acronym (abbreviate) where
import qualified Data.Text as T
import Data.Text(toUpper, splitOn,unpack,pack)


abbreviate :: String -> String
abbreviate xs = pack $ map (toUpper . head) (splitOn " " $ unpack xs)
