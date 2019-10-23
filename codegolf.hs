import Data.Char
import Data.List (sort, group)
import Control.Arrow ((&&&))

main :: IO()
main = do{a <- readFile "texto.txt"
         ;b <- readFile "stopwords.txt"
         ;let out = foldr (++) "" (map (\(a,b) -> (b ++ " - " ++ (show a) ++ "\n")) sorted) where   contents x = [c|c <- (words (map toLower [y|y<-x, (isLetter y)||(y == ' ')||(y=='\n')]))]
                                                                                                    filtered = (sort [c|c <- contents a, not(elem c (contents b))])
                                                                                                    sorted = (take 100 . reverse . sort . map (length &&& head) . group) filtered
         ;writeFile "output.txt" out}