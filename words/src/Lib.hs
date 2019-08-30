module Lib
    ( outputGrid
    , findWord
    , findWords
    , findWordInLine
    , getLines
    , gridWithCoords
    , mapOverGrid
    , skew
    , zipOverGrid
    , zipOverGridWith
    ) where

-- import Data
import Data.List (isInfixOf, transpose)
import Data.Maybe (catMaybes)

data Cell = Cell (Integer, Integer) Char deriving (Eq, Ord, Show)
type Grid a = [[a]]

zipOverGrid :: Grid a -> Grid b -> Grid (a, b)
zipOverGrid = zipWith zip

zipOverGridWith :: (a -> b -> c) -> Grid a -> Grid b -> Grid c
zipOverGridWith = zipWith . zipWith

mapOverGrid :: (a -> b) -> Grid a -> Grid b
mapOverGrid = map . map

coordsGrid :: Grid (Integer, Integer)
coordsGrid =
  let rows = map repeat [0..]
      cols = repeat [0..]
  in zipOverGrid rows cols

gridWithCoords :: Grid Char -> Grid Cell
gridWithCoords grid = zipOverGridWith Cell coordsGrid grid

outputGrid :: Grid Cell -> IO ()
-- outputGrid = putStrLn . unlines
outputGrid grid = putStrLn (formatGrid grid)

formatGrid :: Grid Cell -> String
formatGrid = unlines . mapOverGrid cell2char

cell2char :: Cell -> Char
cell2char (Cell _ c) = c

getLines :: Grid Char -> [String]
getLines grid =
  let horizontal = grid
      vertical = transpose grid
      diagonal1 = diagonalize grid
      diagonal2 = diagonalize $ map reverse grid
      lines = horizontal ++ vertical ++ diagonal1 ++ diagonal2
  in lines ++ (map reverse lines)

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

skew :: Grid Char -> Grid Char
skew [] = []
skew (l:ls) = l : skew (map indent ls)
  where indent line = '_' : line 

