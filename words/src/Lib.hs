module Lib
    ( formatGrid 
    , outputGrid
    , findWord
    , findWords
    , findWordInLine
    , getLines
    -- , findWordInGrid
    ) where

-- import Data
import Data.List (isInfixOf, transpose)
import Data.Maybe (catMaybes)

type Grid = [String]

outputGrid :: Grid -> IO ()
outputGrid grid = putStrLn (formatGrid grid)

formatGrid :: Grid -> String
formatGrid = unlines

findWord :: Grid -> String -> Maybe String
findWord grid word = 
  let found = or $ map (findWordInLine word) (getLines grid)
  in if found then Just word else Nothing

-- findWords :: Grid -> [String] -> [Bool]
findWords grid words = 
  let foundWords = map (findWord grid) words
  in catMaybes foundWords

findWordInLine :: String -> String -> Bool
findWordInLine = isInfixOf

getLines :: Grid -> [String]
getLines grid =
  let horizontal = grid
      vertical = transpose grid
      lines = horizontal ++ vertical
  in lines ++ (map reverse lines)
