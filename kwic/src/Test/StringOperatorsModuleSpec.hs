module StringOperatorsModuleSpec (spec) where

import Test.Hspec

import StringOperatorsModule (unCapitalize, lettersOnly, separateStringInLines, removeWords)

spec :: Spec
spec = 
  describe "Tests for StringOperatorsModule" $ do
    context "unCapitalize" $ do
      it "runs the function in a test string and verifies uncapitalization" $ do
          unCapitalize "ABCabcd" `shouldBe` "abcabcd"

    context "lettersOnly" $ do
      it "runs the function in a test string and verifies ausence of non letters" $ do
          lettersOnly "aA1. " `shouldBe` "a"

    context "separateStringInLines" $ do
      it "runs the function in a test string and verifies string list as output" $ do
          separateStringInLines "abcd \nabc" `shouldBe` ["abcd ", "abc"]

    context "removeWords" $ do
      it "runs the function in a test string list and verifies string list with correct member and its location as output" $ do
          removeWords ["primeiro", "segundo", "terceiro"] ["segundo", "primeiro"] `shouldBe` [("terceiro",2)]