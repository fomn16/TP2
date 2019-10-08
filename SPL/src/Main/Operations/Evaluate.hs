module Operations.Evaluate where

import Base (Expr)
import DataType.Literal
import DataType.Add

class Expr a => Evaluate a where
  evaluate :: a -> Int 

-- Instances of Evaluate
instance Evaluate Literal where
  evaluate (Literal a) = a

instance (Evaluate l, Evaluate r) => Evaluate (Add l r) where
  evaluate (Add l r) = evaluate l + evaluate r