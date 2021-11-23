module Main where

import Presentation.CreateName

main :: IO ()
main = do
  let name = createName "Ion"

  case name of
    Just value -> print value
    Nothing -> print "500"
