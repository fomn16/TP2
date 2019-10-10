module Modules.IOModule.IOModuleInterfaces where

class Input a where
    input :: a -> IO String

class Output a where
    output :: a -> IO ()