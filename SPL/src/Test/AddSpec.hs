module AddSpec (spec) where

import Test.Hspec

import DataType.Literal
import DataType.Add
import Operations.Evaluate (evaluate)
import Operations.PrettyPrint (prettyPrint)

spec :: Spec
spec = 
  describe "Add type" $ do
    context "Evaluating operation" $ do
      it "evaluates Add expression composed by Literals" $
        evaluate (Add  (Literal 3) (Literal 5)) `shouldBe` 8

      it "evaluates Add expression composed by Literal and Add expression" $
        evaluate ( Add (Literal 5) ( Add (Literal 1) (Literal 4) ) ) `shouldBe` 10
        
      it "evaluates Add expression composed by Add's expressions" $
        evaluate ( Add ( Add (Literal 1) (Literal 4) ) ( Add (Literal 5) (Literal 5) ) ) `shouldBe` 15

    context "Printing Operation" $ do
      it "prints Add expression composed by Literals" $
        prettyPrint (Add  (Literal 3) (Literal 5)) `shouldBe` "(3+5)"

      it "prints Add expression composed by Literal and Add expression" $
        prettyPrint ( Add (Literal 5) ( Add (Literal 1) (Literal 4) ) ) `shouldBe` "(5+(1+4))"
        
      it "prints Add expression composed by Add's expressions" $
        prettyPrint ( Add ( Add (Literal 1) (Literal 4) ) ( Add (Literal 5) (Literal 5) ) ) 
          `shouldBe` "((1+4)+(5+5))"
