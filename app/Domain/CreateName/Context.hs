module Domain.CreateName.Context where

import Control.Monad.Reader
import Control.Monad.Trans.Maybe

type Context tOutput = MaybeT (Reader ContextItems) tOutput

type CreateNameRepository = String -> Context String

type CreateNameCommand = String -> Context String

data ContextItem
  = Repository CreateNameRepository
  | Command CreateNameCommand

type ContextItems = [ContextItem]

askRepository :: Context CreateNameRepository
askRepository = MaybeT $ do
  contextItems <- ask
  let repository = head $ [repo | Repository repo <- contextItems]

  return $ Just repository
