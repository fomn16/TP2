module LiteralSpec (spec) where

import Test.Hspec

import DataType.Literal
import Operations.Evaluate (evaluate)
import Operations.PrettyPrint (prettyPrint)

spec :: Spec
spec = 
  describe "Literal type" $ do
    context "Evaluating operation" $
      it "return integer value when called evaluate" $ 
        evaluate (Literal 10) `shouldBe` 10
    
    context "Printing operation" $
      it "return string of value when called printing" $
        prettyPrint (Literal 10) `shouldBe` "10"