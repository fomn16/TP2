module ProcessModule
(   processAll
) where

import StringOperatorsModule (unCapitalize, lettersOnly)
import ListOperatorsModule (secondTermsFromPair, quickSort, removeCommonFromFirstList, separateInTerms)

--monta uma string dadas as localizações das palavras chave da string de origem
genText :: [Int] -> [String] -> Int -> Int -> String
genText [] _ _ _= ""
genText (i:is) b 0 _ = (b !! i) ++ (genText [i+1] b 1 (length b)) ++ "/" ++ (genText [0] b 1 i) ++ "\n" ++ genText is b 0 0
genText (i:is) b 1 n
    |i < n = " " ++ b !! i ++ genText [i+1] b 1 n
    |otherwise = ""

--processa as strings fornecidas
processEntry :: String -> String -> String
processEntry textContents stopWordContents = genText (secondTermsFromPair sortedText) separatedText 0 0
    where
        sortedText = quickSort unsortedText
        unsortedText = removeCommonFromFirstList filteredSeparatedText separatedStopWords 0
        filteredSeparatedText = map lettersOnly uncapitalizedSeparatedText
        uncapitalizedSeparatedText = map unCapitalize separatedText
        separatedText = separateInTerms textContents [] ' '
        separatedStopWords = separateInTerms (filter (/= ' ') stopWordContents) [] ' '

processAll :: String -> String -> String
processAll a b = apply processEntry (separateInTerms a [] '\n') b
    where
        apply _ [] _ = ""
        apply f (a:as) b = (f a b) ++ "\n" ++ apply f as b