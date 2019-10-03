module ListOperatorsModule
(secondTermsFromPair
,quickSort
,removeCommonFromFirstList
,separateInTerms
) where

--Tem como saída todo o conteúdo da lista até a posição fornecida
firstTerms :: [t] -> Int -> [t]
firstTerms [] _= []
firstTerms (a:as) n
    |n==0 = []
    |otherwise = a:(firstTerms as (n-1))

-- Tem como saída a posição do primeiro termo indicado da lista fornecida
nToTerm :: Eq t => [t] -> t -> Int
nToTerm [] _ = 0
nToTerm (a:as) b
    |(a == b) = 0
    |otherwise = (nToTerm as b) + 1

--tem como saída a string de entrada, com o numero indicado de seus primeiros termos removidos
delFromStart :: [t] -> Int -> [t]
delFromStart a 0 = a
delFromStart [] _ = []
delFromStart (a:as) n = delFromStart as (n-1)

--dado [t] de um tipo e uma lista vazia, tem como saída [[t]], que consiste de [t] separada nas instâncias de um termo t fornecido
separateInTerms :: Eq t => [t] -> [[t]] -> t -> [[t]]
separateInTerms [] b _ = b
separateInTerms a b c = separateInTerms (delFromStart a ((nToTerm a c) +1)) (b ++ [firstTerms a (nToTerm a c)]) c

--tem saída verdadeira se o termo fornecida se encontra na lista fornecida
isInList :: Eq t => t -> [t] -> Bool
isInList _ [] = False
isInList a (b:bs)
    |a == b = True
    |otherwise = isInList a bs

--dadas duas listas e uma entrada '0', tem como saída a primeira lista sem seus termos em comum com a segunda em uma dupla com a posição de seus termos na lista original
removeCommonFromFirstList :: Eq t => [t] -> [t] -> Int -> [(t, Int)]
removeCommonFromFirstList [] _ _ = []
removeCommonFromFirstList (a:as) b i
    |isInList a b = removeCommonFromFirstList as b (i+1)
    |otherwise = [(a,i)] ++ (removeCommonFromFirstList as b (i+1))

--organiza a lista fornecida em ordem alfabética, tem como saída apenas as posições que as palavras ocupavam na lista.
quickSort :: Ord t => [t] -> [t]
quickSort [] = []
quickSort (a:as) = (quickSort [b|b<-as, b<a]) ++ [a] ++ (quickSort [b|b<-as, b>a])

--Dada uma lista de duplas, retorna uma lista com apenas o segundo termo das duplas
secondTermsFromPair :: [(t0,t1)] -> [t1]
secondTermsFromPair a = map (\(x,y) -> y) a