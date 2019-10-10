module KwicModuleSpec (spec) where

import Test.Hspec

import Modules.KwicModule.KwicModule

spec :: Spec
spec = 
  describe "Test for KwicModule" $ do
    it "runs the function in a test string and verifies output" $ do
      kwic "Encyclopedia of research on library science" "on" `shouldBe` "Encyclopedia of research on library science/\nlibrary science/ Encyclopedia of research on\nof research on library science/ Encyclopedia\nresearch on library science/ Encyclopedia of\nscience/ Encyclopedia of research on library\n\n"