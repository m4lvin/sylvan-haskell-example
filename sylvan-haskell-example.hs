{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use >=>" #-}
module Main where

import Sylvan
import System.IO

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  putStrLn "laceInit ..."
  laceInit 0 0
  laceStartup
  putStrLn "sylvanInitPackage ..."
  sylvanInitPackage (2^(22::Int)) (2^(25::Int)) (2^(22::Int)) (2^(25::Int))
  sylvanInit
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

  putStr "1 OR 1 == 1 : "
  ithVar 1 >>= \b ->
    ithVar 1 >>= \c ->
    bor b c >>= \d ->
    print (d == b)

  putStr "1 AND 3 == 1 : "
  ithVar 1 >>= \b ->
    ithVar 3 >>= \c ->
    band b c >>= \d ->
    print (d == b)

  -- this crashes:
  putStr "(1 AND 2) OR 3 == 1 : "
  ithVar 1 >>= \one ->
    ithVar 2 >>= \two ->
    band one two >>= \combo ->
    ithVar 3 >>= \three ->
    bor combo three >>= \result ->
    print (result == one)

  putStrLn "Bye!"
