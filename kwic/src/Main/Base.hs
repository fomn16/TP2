module Base where

import Modules.KwicModule.KwicModule

import Modules.IOModule.IOModuleInterfaces
import Modules.IOModule.IOModuleImplementations

main :: IO ()
main = do {textContents <- input (Local "texto.txt")
          ;stopWordContents <- input (Local "stopwords.txt")
          ;let result = kwic textContents stopWordContents
          ;output (Local result)}