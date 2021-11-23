module Domain.GetNames.Command where

import Control.Monad.Reader
import Control.Monad.Trans.Maybe
import Domain.GetNames.Context

getRepository :: Context GetNamesRepository
getRepository = MaybeT $ do
  contextItems <- ask
  let contextItem = head contextItems

  case contextItem of
    Repository repo -> return $ Just repo
    _ -> return Nothing

getNames :: GetNamesCommand
getNames input = do
  repository <- getRepository
  repository input
