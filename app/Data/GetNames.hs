module Data.GetNames where

import Control.Monad.Trans.Maybe
import Domain.GetNames.Context

getNames :: GetNamesRepository
getNames _parameter = MaybeT $ do
  return $ Just ["Ion"]
