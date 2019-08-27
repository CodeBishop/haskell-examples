module Lib
    ( outputGrid
    , findWord
    , findWords
    , findWordInLine
    , getLines
    , skew
    , zipOverGrid
    , zipOverGridWith
    -- , findWordInGrid
    ) where

-- import Data
import Data.List (isInfixOf, transpose)
import Data.Maybe (catMaybes)

data Cell = Cell (Integer, Integer) Char deriving (Eq, Ord, Show)

type Grid a = [[a]]

coordsGrid =
  let rows = map repeat [0..]
      cols = repeat [0..]
  in zipOverGrid rows cols

diagonalize :: Grid Char -> Grid Char
diagonalize = transpose . skew

findWord :: Grid Char -> String -> Maybe String
findWord grid word = 
  let found = or $ map (findWordInLine word) (getLines grid)
  in if found then Just word else Nothing

findWords :: Grid Char -> [String] -> [String]
findWords grid words = 
  let foundWords = map (findWord grid) words
  in catMaybes foundWords

findWordInLine :: String -> String -> Bool
findWordInLine = isInfixOf

getLines :: Grid Char -> [String]
getLines grid =
  let horizontal = grid
      vertical = transpose grid
      diagonal1 = diagonalize grid
      diagonal2 = diagonalize $ map reverse grid
      lines = horizontal ++ vertical ++ diagonal1 ++ diagonal2
  in lines ++ (map reverse lines)

gridWithCoords grid = zipOverGridWith Cell coordsGrid grid

outputGrid :: Grid Char -> IO ()
outputGrid = putStrLn . unlines

skew :: Grid Char -> Grid Char
skew [] = []
skew (l:ls) = l : skew (map indent ls)
  where indent line = '_' : line 

zipOverGrid :: Grid a -> Grid -> b -> Grid (a, b)
zipOverGrid = zipWith zip
zipOverGridWith = zipWith . zipWith
-- zipOverGridWith f a b = (zipWith (zipWith f)) a b 
