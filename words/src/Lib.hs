module Lib
    ( outputGrid
    , findWord
    , findWords
    , findWordInLine
    , getLines
    , skew
    -- , findWordInGrid
    ) where

-- import Data
import Data.List (isInfixOf, transpose)
import Data.Maybe (catMaybes)

data Cell = Cell (Integer, Integer) Char deriving (Eq, Ord, Show)

type Grid = [String]

diagonalize :: Grid -> Grid
diagonalize = transpose . skew

findWord :: Grid -> String -> Maybe String
findWord grid word = 
  let found = or $ map (findWordInLine word) (getLines grid)
  in if found then Just word else Nothing

findWords :: Grid -> [String] -> [String]
findWords grid words = 
  let foundWords = map (findWord grid) words
  in catMaybes foundWords

findWordInLine :: String -> String -> Bool
findWordInLine = isInfixOf

getLines :: Grid -> [String]
getLines grid =
  let horizontal = grid
      vertical = transpose grid
      diagonal1 = diagonalize grid
      diagonal2 = diagonalize $ map reverse grid
      lines = horizontal ++ vertical ++ diagonal1 ++ diagonal2
  in lines ++ (map reverse lines)

outputGrid :: Grid -> IO ()
outputGrid = putStrLn . unlines

skew :: Grid -> Grid
skew [] = []
skew (l:ls) = l : skew (map indent ls)
  where indent line = '_' : line 

zipOverGrid = zipWith zip
zipOverGridWith = zipWith . zipWith
-- zipOverGridWith f a b = (zipWith (zipWith f)) a b 
