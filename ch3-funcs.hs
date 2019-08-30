module Rvrs where

import Data.List

thirdo :: String -> Char
thirdo str = str !! 2

dropLast = reverse . tail . reverse

getHelloChar = (!!) "Hello World"

rvrs = (intercalate " ") . reverse . words

main :: IO ()
main = print $ rvrs "Hakell id awsorm"
