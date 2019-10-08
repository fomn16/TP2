module DataType.Literal where

import Base (Expr) 

newtype Literal = Literal Int
instance Expr Literal 