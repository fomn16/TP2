module IOModuleSpec (spec) where

import Test.Hspec

import Modules.IOModule.IOModuleInterfaces
import Modules.IOModule.IOModuleImplementations


spec :: Spec
spec = 
  describe "Tests for IOModule" $ do
    context "file IO test" $ do
      it "creates a file and returns its contents" $ do
          output (Local "teste")
          teste <- input (Local "output.txt")
          teste `shouldBe` "teste"