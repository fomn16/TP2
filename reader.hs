import Data.Char (ord)
import Data.Char (chr)

--Tem como saída todo o conteúdo da string até a posição fornecida
firstTerms :: String -> Int -> String
firstTerms [] _= []
firstTerms (a:as) n
    |n==0 = []
    |otherwise = a:(firstTerms as (n-1))

-- Tem como saída a posição do primeiro caractere indicado da string fornecida
nToChar :: String -> Char -> Int
nToChar [] _ = 0
nToChar (a:as) b
    |(a == b) = 0
    |otherwise = (nToChar as b) + 1

--tem como saída a string de entrada, com o numero indicado de seus primeiros termos removidos
delFromStart :: String -> Int -> String
delFromStart a 0 = a
delFromStart [] _ = []
delFromStart (a:as) n = delFromStart as (n-1)

--dada uma string e uma lista vazia, tem como saída uma lista com as partes da string de entrada separadas
separate :: String -> [String] -> Char -> [String]
separate [] b _ = b
separate a b c = separate (delFromStart a ((nToChar a c) +1)) (b ++ [firstTerms a (nToChar a c)]) c

--tem como saída a string de entrada com suas letras maiúsculas substituidas por minúsculas
unCapitalize :: String -> String
unCapitalize [] = []
unCapitalize (a:as)
    |(ord a > 64)&&(ord a < 91) = (chr ((ord a) + 32)):(unCapitalize as)
    |otherwise = a:(unCapitalize as)

--retira todos os caracteres que não são letras minúsulas da string de entrada
lettersOnly :: String -> String
lettersOnly a = [b|b<-a, (ord b > 96)&&(ord b < 123)]

--tem saída verdadeira se a string fornecida está na lita de strings fornecida
isInList :: String -> [String] -> Bool
isInList _ [] = False
isInList a (b:bs)
    |a == b = True
    |otherwise = isInList a bs

--dada uma lista com palavras, uma lista de stopwords e uma entrada '0', tem como saída uma lista contendo apenas as palavras que nao eram stopwords e sua localização na lista original
delStopWords :: [String] -> [String] -> Int -> [(String, Int)]
delStopWords [] _ _ = []
delStopWords (a:as) b i
    |isInList a b = delStopWords as b (i+1)
    |otherwise = [(a,i)] ++ (delStopWords as b (i+1))

--tem como saída um inteiro comparando como as strings das entradas fornecidas se relacionam em ordem alfabética
--0 = Primeiro vem antes, 1 = Primeiro vem depois, 2 = São iguais 
relate :: (String,Int) -> (String,Int) -> Int
relate ([], _) ((a:as), _) = 0
relate ((a:as), _) ([], _) = 1
relate ([], _) ([], _) = 2
relate ((a:as), intA) ((b:bs),intB)
    |ord a == ord b = relate (as, intA) (bs, intB)
    |ord a < ord b = 0
    |ord a > ord b = 1

--organiza eficientemente a lista fornecida em ordem alfabética, tem como saída apenas as posições que as palavras ocupavam na lista.
quickSort :: [(String, Int)] -> [Int]
quickSort [] = []
quickSort ((a0,a1):as) = (quickSort [b|b<-as, relate (a0,a1) b == 1]) ++ [a1] ++ (quickSort [b|b<-as, relate (a0,a1) b == 0])

--monta uma string dadas as localizações das palavras chave da string de origem
genText :: [Int] -> [String] -> Int -> Int -> String
genText [] _ _ _= ""
genText (i:is) b 0 _ = (b !! i) ++ (genText [i+1] b 1 (length b)) ++ "/" ++ (genText [0] b 1 i) ++ "\n" ++ genText is b 0 0
genText (i:is) b 1 n
    |i < n = " " ++ b !! i ++ genText [i+1] b 1 n
    |otherwise = ""

--processa as strings fornecidas
processEntry :: String -> String -> String
processEntry textContents stopWordContents = genText sortedText separatedText 0 0
    where
        sortedText = quickSort unsortedText
        unsortedText = delStopWords filteredSeparatedText separatedStopWords 0
        filteredSeparatedText = map lettersOnly uncapitalizedSeparatedText
        uncapitalizedSeparatedText = map unCapitalize separatedText
        separatedText = separate textContents [] ' '
        separatedStopWords = separate (filter (/= ' ') stopWordContents) [] ' '

processAll :: String -> String -> String
processAll a b = apply processEntry (separate a [] '\n') b
    where
        apply _ [] _ = ""
        apply f (a:as) b = (f a b) ++ "\n" ++ apply f as b

initial :: String -> String -> IO Int
initial text stopwords = do{textContents <- readFile text
                ;stopWordContents <- readFile stopwords
                ;let result = processAll textContents stopWordContents
                ;writeFile "output.txt" result
                ;return 1}