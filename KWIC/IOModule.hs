module IOModule
(   inputFromFile
,   outputToFile
) where

inputFromFile :: String -> IO String
inputFromFile fileName = readFile fileName

outputToFile :: String -> IO ()
outputToFile content = writeFile "output.txt" content