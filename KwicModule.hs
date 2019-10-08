module KwicModule
(   kwic
) where

import StringOperatorsModule (unCapitalize, lettersOnly, separateStringInLines, removeWords)
import ListOperatorsModule (secondTermsFromPair, quickSort, separateInTerms)

--monta uma string dadas as localizações das palavras chave da string de origem
generateText :: [Int] -> [String] -> Int -> Int -> String
generateText [] _ _ _= ""
generateText (i:is) b 0 _ = (b !! i) ++ (generateText [i+1] b 1 (length b)) ++ "/" ++ (generateText [0] b 1 i) ++ "\n" ++ generateText is b 0 0
generateText (i:is) b 1 n
    |i < n = " " ++ b !! i ++ generateText [i+1] b 1 n
    |otherwise = ""

--processa as strings fornecidas
processLines :: String -> String -> String
processLines textContents stopWordContents = generateText (secondTermsFromPair sortedText) separatedText 0 0
    where
        sortedText = quickSort unsortedText
        unsortedText = removeWords filteredSeparatedText separatedStopWords
        filteredSeparatedText = map lettersOnly uncapitalizedSeparatedText
        uncapitalizedSeparatedText = map unCapitalize separatedText
        separatedText = separateInTerms textContents [] ' '
        separatedStopWords = separateInTerms (filter (/= ' ') stopWordContents) [] ' '

kwic :: String -> String -> String
kwic a b = apply processLines (separateStringInLines a) b
    where
        apply _ [] _ = ""
        apply f (a:as) b = (f a b) ++ "\n" ++ apply f as b