module Modules.KwicModule.KwicModule (kwic) where

import Modules.StringOperatorsModule.StringOperatorsModule (unCapitalize, lettersOnly, separateStringInLines, removeWords)
import Modules.ListOperatorsModule.ListOperatorsModule (secondTermsFromPair, quickSort, separateInTerms)

--separa as linhas da primeira string de entrada e aplica process lines em cada uma, concatenando as saídas
kwic :: String -> String -> String
kwic a b = apply processLines (separateStringInLines a) b
    where
        apply _ [] _ = ""
        apply f (a:as) b = (f a b) ++ "\n" ++ apply f as b

--processa as strings fornecidas de acordo com o algoritmo Kwic implementado
processLines :: String -> String -> String
processLines textContents stopwordContents = generateText Default (secondTermsFromPair sortedKeywords) separatedText 0 0
    where                                                                       --passos:
        sortedKeywords = quickSort unsortedKeywords                             --  6 : ordena palavras restantes do título
        unsortedKeywords = removeWords filteredText stopwords                   --  5 : retira stopwords das palavras do título, "anotando" seus lugares originais
        filteredText = map lettersOnly uncapitalizedText                        --  4 : retira qualquer coisa que não letras minúsculas das palavras do título
        uncapitalizedText = map unCapitalize separatedText                      --  3 : retira letras maiúsculas das palavras do título substituindo-as por minúsculas
        stopwords = separateInTerms (filter (/= ' ') stopwordContents) [] ' '   --  2 : separa string de stopwords em palavras
        separatedText = separateInTerms textContents [] ' '                     --  1 : separa string do título em palavras

data Default = Default

class GenerateText a where
    generateText :: a -> [Int] -> [String] -> Int -> Int -> String

--monta uma string dadas as localizações das palavras chave da string de origem, a string original, 0 e 0 respectivamente.
instance GenerateText Default where
    generateText Default [] _ _ _= ""
    generateText Default (i:is) b 0 _ = (b !! i) ++ (generateText Default [i+1] b 1 (length b)) ++ "/" ++ (generateText Default [0] b 1 i) ++ "\n" ++ generateText Default is b 0 0
    generateText Default [i] b 1 n --escreve o que vem entre as posições i e n na lista b
        |i < n = " " ++ b !! i ++ generateText Default [i+1] b 1 n
        |otherwise = ""
