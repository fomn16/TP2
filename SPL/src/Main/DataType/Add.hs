module DataType.Add where

import Base (Expr)  

data Add l r = Add l r
instance (Expr l, Expr r) => Expr (Add l r)  
