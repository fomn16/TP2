module AllSpec (spec) where

import Test.Hspec

import IOModule
import StringOperatorsModule (unCapitalize, lettersOnly, separateStringInLines, removeWords)
import ListOperatorsModule (secondTermsFromPair, quickSort, separateInTerms)

spec :: Spec
spec = 
  describe "All automated tests" $ do
    context "IOModule" $ do
      it "creates a file and returns its contents" $ do
          output (Local "teste")
          teste <- input (Local "output.txt")
          teste `shouldBe` "teste"

    context "StringOperatorsModule.unCapitalize" $ do
      it "runs the function in a test string and verifies uncapitalization" $ do
          unCapitalize "ABCabcd" `shouldBe` "abcabcd"

    context "StringOperatorsModule.lettersOnly" $ do
      it "runs the function in a test string and verifies ausence of non letters" $ do
          lettersOnly "aA1. " `shouldBe` "a"

    context "StringOperatorsModule.separateStringInLines" $ do
      it "runs the function in a test string and verifies string list as output" $ do
          separateStringInLines "abcd \nabc" `shouldBe` ["abcd ", "abc"]

    context "StringOperatorsModule.removeWords" $ do
      it "runs the function in a test string list and verifies string list with correct member and its location as output" $ do
          removeWords ["primeiro", "segundo", "terceiro"] ["segundo", "primeiro"] `shouldBe` [("terceiro",2)]

    context "ListOperatorsModule.secondTermsFromPair" $ do
      it "runs the function in a test list of doubles and verifies list of second terms as output" $ do
          secondTermsFromPair [('a',1), ('b', 2), ('c', 3)] `shouldBe` [1, 2, 3]

    context "ListOperatorsModule.quickSort" $ do
      it "runs the function in a test list and verifies sorted list as output" $ do
          quickSort [('b', 2), ('a',1), ('c', 3)] `shouldBe` [('a',1), ('b', 2), ('c', 3)]

    context "ListOperatorsModule.separateInTerms" $ do
      it "runs the function in a test list and verifies list separated in designated terms" $ do
          separateInTerms [1,2,3,4,1,2,3,4,3,2,1,4,3,2,1] [] 3 `shouldBe` [[1,2],[4,1,2], [4], [2,1,4], [2,1]]
