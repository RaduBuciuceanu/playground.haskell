module Domain.CreateName.Command (createName) where

import Control.Monad.Reader
import Control.Monad.Trans.Maybe
import Domain.CreateName.Context

getRepository :: Context CreateNameRepository
getRepository = MaybeT $ do
  contextItems <- ask
  let contextItem = head contextItems

  case contextItem of
    Repository repo -> return $ Just repo
    _ -> return Nothing

createName :: CreateNameCommand
createName input = do
  repository <- getRepository
  repository input
