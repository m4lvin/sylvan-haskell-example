module Main where

import Sylvan

main :: IO ()
main = do
  putStrLn "laceInit ..."
  laceInit 0 0
  laceStartup
  putStrLn "sylvanInitPackage ..."
  sylvanInitPackage (2^(22::Int)) (2^(25::Int)) (2^(22::Int)) (2^(25::Int))
  putStr "T == T : "; print (sylvanTrue == sylvanTrue)
  putStr "F == T : "; print (sylvanFalse == sylvanTrue)
  putStr "F == F : "; print (sylvanFalse == sylvanFalse)
  a <- ithVar (11::BDDVar)
  putStr "OR(a, NOT a) == T : "
  taut <- bor a (neg a)
  print (taut == sylvanTrue)
  putStr "AND(-a, a) == F : "
  contr <- band (neg a) a
  print (contr == sylvanFalse)
  putStrLn "Bye!"
