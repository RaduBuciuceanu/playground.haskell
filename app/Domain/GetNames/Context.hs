module Domain.GetNames.Context where

import Control.Monad.Reader
import Control.Monad.Trans.Maybe

type Context tOutput = MaybeT (Reader ContextItems) tOutput

type GetNamesRepository = String -> Context [String]

type GetNamesCommand = String -> Context [String]

data ContextItem
  = Repository GetNamesRepository
  | Command GetNamesCommand

type ContextItems = [ContextItem]
