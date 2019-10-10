module Base where

import KwicModule
import IOModule

main :: IO ()
main = do {textContents <- input (Local "texto.txt")
          ;stopWordContents <- input (Local "stopwords.txt")
          ;let result = kwic textContents stopWordContents
          ;output (Local result)}