module Main where

import Presentation.CreateName

main :: IO ()
main = do
  let names = createName "caca"

  case names of
    Just value -> print value
    Nothing -> print "500"
