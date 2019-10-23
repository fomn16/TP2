import Data.List (sort, group)
import Data.Char
import Control.Arrow ((&&&))

main :: IO()
main = do{a <- readFile "texto.txt"
         ;b <- readFile "stopwords.txt"
         ;let out = (foldr (++) "" . map (\(a,b) -> (b ++ " - " ++ (show a) ++ "\n")) . take 100 . reverse . sort . map (length &&& head) . group . sort . filter (\x -> not (elem x (contents b))) . contents) a  where contents x = (words . map toLower . filter (\y -> (isLetter y)||(y == ' ')||(y=='\n'))) x
         ;writeFile "output.txt" out}