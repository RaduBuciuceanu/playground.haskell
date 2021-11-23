module Main where

import Presentation.GetNames

main :: IO ()
main = do
  let names = getNames "caca"

  case names of
    Just value -> print value
    Nothing -> print "500"
