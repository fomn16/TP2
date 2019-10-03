module StringOperatorsModule
(unCapitalize
,lettersOnly
) where

import Data.Char (ord)
import Data.Char (chr)

--tem como saída a string de entrada com suas letras maiúsculas substituidas por minúsculas
unCapitalize :: String -> String
unCapitalize [] = []
unCapitalize (a:as)
    |(ord a > 64)&&(ord a < 91) = (chr ((ord a) + 32)):(unCapitalize as)
    |otherwise = a:(unCapitalize as)

--retira todos os caracteres que não são letras minúsulas da string de entrada
lettersOnly :: String -> String
lettersOnly a = [b|b<-a, (ord b > 96)&&(ord b < 123)]
