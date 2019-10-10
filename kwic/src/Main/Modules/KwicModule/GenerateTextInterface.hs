module Modules.KwicModule.GenerateTextInterface where

--monta uma string dadas as localizações das palavras chave da string de origem, a string original, 0 e 0 respectivamente.
class GenerateText a where
    generateText :: a -> [Int] -> [String] -> Int -> Int -> String