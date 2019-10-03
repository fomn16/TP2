import ProcessModule (processAll)
import IOModule (inputFromFile, outputToFile)

run :: String -> String -> IO ()
run textFileName stopwordsFileName = do {textContents <- inputFromFile textFileName
                                        ;stopWordContents <- inputFromFile stopwordsFileName
                                        ;let result = processAll textContents stopWordContents
                                        ;outputToFile result}