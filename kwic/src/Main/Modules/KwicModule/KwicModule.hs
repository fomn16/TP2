module Modules.KwicModule.KwicModule (kwic) where

import Modules.StringOperatorsModule.StringOperatorsModule (unCapitalize, lettersOnly, separateStringInLines, removeWords)
import Modules.ListOperatorsModule.ListOperatorsModule (secondTermsFromPair, quickSort, separateInTerms)

import Modules.KwicModule.GenerateTextImplementations
import Modules.KwicModule.GenerateTextInterface

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