module Domain.CreateName.Context where

import Control.Monad.Reader
import Control.Monad.Trans.Maybe

type Context tOutput = MaybeT (Reader ContextItems) tOutput

type Repository = String -> Context String

type Command = String -> Context String

data ContextItem
  = Repository Repository
  | Command Command

type ContextItems = [ContextItem]
