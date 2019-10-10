module Modules.IOModule.IOModuleImplementations where
import Modules.IOModule.IOModuleInterfaces

data Local = Local String

instance Input Local where
    input (Local a) = readFile a

instance Output Local where
    output (Local content) = writeFile "output.txt" content