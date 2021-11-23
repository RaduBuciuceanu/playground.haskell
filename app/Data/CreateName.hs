module Data.CreateName where

import Control.Monad.Trans.Maybe
import Domain.CreateName.Context

createName :: CreateNameRepository
createName input = MaybeT $ do
  return $ Just input
