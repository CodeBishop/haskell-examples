data Compass = North | East | South | West
  deriving (Eq, Ord, Enum, Show)

-- instance Show Compass where
--   show North = "NORTH"
--   show West = "WEST"
--   show South = "SOUTH"
--   show East = "EAST"

-- instance Eq Compass where
--   (==) North North = True
--   (==) West West = True
--   (==) South South = True
--   (==) East East = True
