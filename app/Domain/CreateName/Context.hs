module Domain.CreateName.Context where

import Control.Monad.Reader
import Data.List
import Data.Typeable

type Repository = String -> Maybe String

type Command = String -> Maybe String

data Item
  = Repository Repository
  | Command Command

type Context = [Item]
