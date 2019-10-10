module Modules.KwicModule.GenerateTextImplementations where

import Modules.KwicModule.GenerateTextInterface

data Default = Default

instance GenerateText Default where
    generateText _ [] _ _ _= ""
    generateText a (i:is) b 0 _ = (b !! i) ++ (generateText a [i+1] b 1 (length b)) ++ "/" ++ (generateText a [0] b 1 i) ++ "\n" ++ generateText a is b 0 0
    generateText a [i] b 1 n --escreve o que vem entre as posições i e n na lista b
        |i < n = " " ++ b !! i ++ generateText a [i+1] b 1 n
        |otherwise = ""
