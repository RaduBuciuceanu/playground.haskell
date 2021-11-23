module Domain.CreateName.Command (createName) where

import qualified Domain.CreateName.Context as Context
import Control.Monad.Reader

createName :: Context.Command
createName = do
  -- context <- ask
  -- let repo = head context 
  
  let value = Just "S"
  return value
