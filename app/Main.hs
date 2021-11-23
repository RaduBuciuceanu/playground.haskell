module Main where

import Control.Monad.Reader
import Control.Monad.Trans.Maybe

type Context tOutput = MaybeT (Reader Items) tOutput

type DataCreateName = String -> Context String

type DomainCreateName = String -> Context String

type PresentationCreateName = String -> Maybe String

data Item
  = Command DomainCreateName
  | Repository DataCreateName
  | Controller PresentationCreateName

type Items = [Item]

makeContextItems :: Items
makeContextItems =
  [ Command domainCreateName,
    Repository dataCreateName,
    Controller presentationCreateName
  ]

dataCreateName :: DataCreateName
dataCreateName input = MaybeT $ do
  return $ Just input

domainCreateName :: DomainCreateName
domainCreateName input = MaybeT $ do
  return $ Just input

presentationCreateName :: PresentationCreateName
presentationCreateName input = do
  let maybeT = runMaybeT $ domainCreateName input
  runReader maybeT makeContextItems

main :: IO ()
main = do
  let name = presentationCreateName "Ion"

  case name of
    Just value -> print value
    Nothing -> print "500"
