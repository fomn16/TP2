module Operations.PrettyPrint where

import Base (Expr)
import DataType.Literal
import DataType.Add

class Expr a => PrettyPrint a where
  prettyPrint :: a -> String

-- Instances of Pretty Print
instance PrettyPrint Literal where
  prettyPrint (Literal a) = show a

instance (PrettyPrint l, PrettyPrint r) => PrettyPrint (Add l r) where
  prettyPrint (Add l r) = "(" ++ prettyPrint l ++ "+" ++ prettyPrint r ++ ")"