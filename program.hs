-- Change the ridiculous name of this file
main :: IO ()
main = do
    content <- readFile "numbers.txt"
    print content
