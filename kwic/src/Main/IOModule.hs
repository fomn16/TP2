module IOModule where

data Local = Local String

class Input a where
    input :: a -> IO String

class Output a where
    output :: a -> IO ()

instance Input Local where
    input (Local a) = readFile a

instance Output Local where
    output (Local content) = writeFile "output.txt" content