import KwicModule (kwic)
import IOModule (inputFromFile, outputToFile)

run :: String -> String -> IO ()
run textFileName stopwordsFileName = do {textContents <- inputFromFile textFileName
                                        ;stopWordContents <- inputFromFile stopwordsFileName
                                        ;let result = kwic textContents stopWordContents
                                        ;outputToFile result}