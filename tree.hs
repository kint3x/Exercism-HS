


data Tree = EmptyTree 
            | Node Int Int (Tree) (Tree) deriving (Show,Eq)


insertTree (k,v) EmptyTree = Node k v EmptyTree EmptyTree
insertTree (k,v) (Node ok ov t1 t2)
    | k < ok = (Node ok ov (insertTree (k,v) t1) t2)
    | k > ok = (Node ok ov t1 (insertTree (k,v) t2))
    | otherwise = Node ok v t1 t2

findValue :: Int -> Tree -> Maybe Int
findValue k EmptyTree = Nothing
findValue k (Node ok ov t1 t2) 
    | k < ok = findValue k (t1)
    | k > ok = findValue k (t2)
    | otherwise = Just ov
    


data AType a
    = Val Int
    | Var a
    | Neg (AType a)
    | Add (AType a) (AType a)
    | Sub (AType a) (AType a)
    deriving (Show)

um (Var a) = Var a
um (Val a) = Val a

um (Add a b) = Add (um a) (um b)
um (Sub a b) = Sub (um a) (um b)

testExpr1 :: AType String
testExpr1 = Sub (Var "x") (Val 5)

testExpr2 :: AType String
testExpr2 = Neg (Add (Var "y") (Val 2))

main :: IO ()
main = do
  putStrLn $ show testExpr1  -- prints: "Sub (Var \"x\") (Val 5)"
  putStrLn $ show testExpr2  -- prints: "Neg (Add (Var \"y\") (Val 2))"