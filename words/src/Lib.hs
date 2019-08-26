module Lib
    ( formatGrid 
    , outputGrid
    , findWord
    , findWords
    , findWordInLine
    -- , findWordInGrid
    ) where

-- import Data
import Data.List (isInfixOf)
import Data.Maybe (catMaybes)

type Grid = [String]

outputGrid :: Grid -> IO ()
outputGrid grid = putStrLn (formatGrid grid)

formatGrid :: Grid -> String
formatGrid = unlines

findWord :: Grid -> String -> Maybe String
findWord grid word = 
  let lines = grid ++ (map reverse grid)
      found = or $ map (findWordInLine word) lines
  in if found then Just word else Nothing

-- findWords :: Grid -> [String] -> [Bool]
findWords grid words = 
  let foundWords = map (findWord grid) words
  in catMaybes foundWords

findWordInLine :: String -> String -> Bool
findWordInLine = isInfixOf
