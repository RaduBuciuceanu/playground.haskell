module Main where

import Control.Monad.Reader
import Control.Monad.Trans.Maybe

type Context tOutput = MaybeT (Reader ContextItems) tOutput

type DataCreateName = String -> Context String

type DomainCreateName = String -> Context String

type PresentationCreateName = String -> Maybe String

data ContextItem
  = Command DomainCreateName
  | Repository DataCreateName
  | Controller PresentationCreateName

type ContextItems = [ContextItem]

makeContextItems :: ContextItems
makeContextItems =
  [ Repository dataCreateName,
    Command domainCreateName,
    Controller presentationCreateName
  ]

dataCreateName :: DataCreateName
dataCreateName input = MaybeT $ do
  return $ Just input

domainGetDependency :: Context DataCreateName
domainGetDependency = MaybeT $ do
  contextItems <- ask
  let contextItem = head contextItems

  case contextItem of
    Repository repo -> return $ Just repo
    _ -> return Nothing

domainCreateName :: DomainCreateName
domainCreateName input = do
  repository <- domainGetDependency
  repository input

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
