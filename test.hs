main :: IO ()
main = putStrLn "Hi there\n\n"

greet x = "Hey " ++ x

add x y  = x + y
add :: Int -> Int -> Int
