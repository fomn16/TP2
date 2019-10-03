module MainModule
(    run
) where

import ProcessModule (processAll)
import IOModule (inputFromFile, outputToFile)

run :: String -> String -> IO Int
run textFileName stopwordsFileName = do {textContents <- inputFromFile textFileName
                                        ;stopWordContents <- inputFromFile stopwordsFileName
                                        ;let result = processAll textContents stopWordContents
                                        ;outputToFile result
                                        ;return 1}