module Modules.IOModule.IOModule where

class Input a where
    input :: a -> IO String

class Output a where
    output :: a -> IO ()

data Local = Local String

instance Input Local where
    input (Local a) = readFile a

instance Output Local where
    output (Local content) = writeFile "output.txt" content