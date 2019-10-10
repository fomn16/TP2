module ListOperatorsModuleSpec (spec) where

import Test.Hspec

import Modules.ListOperatorsModule.ListOperatorsModule (secondTermsFromPair, quickSort, separateInTerms)

spec :: Spec
spec = 
  describe "Tests for ListOperatorsModule" $ do
    context "secondTermsFromPair" $ do
      it "runs the function in a test list of doubles and verifies list of second terms as output" $ do
          secondTermsFromPair [('a',1), ('b', 2), ('c', 3)] `shouldBe` [1, 2, 3]

    context "quickSort" $ do
      it "runs the function in a test list and verifies sorted list as output" $ do
          quickSort [('b', 2), ('a',1), ('c', 3)] `shouldBe` [('a',1), ('b', 2), ('c', 3)]

    context "separateInTerms" $ do
      it "runs the function in a test list and verifies list separated in designated terms" $ do
          separateInTerms [1,2,3,4,1,2,3,4,3,2,1,4,3,2,1] [] 3 `shouldBe` [[1,2],[4,1,2], [4], [2,1,4], [2,1]]
