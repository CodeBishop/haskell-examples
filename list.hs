newHead :: [a] -> a
newHead [] = error "empty list"
newHead [a] = a
newHead (x:xs) = x

newTail :: [a] -> [a]
newTail [] = error "empty list"
newTail [a] = []
newTail (x:xs) = xs
