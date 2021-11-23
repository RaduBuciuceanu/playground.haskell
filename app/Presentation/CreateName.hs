module Presentation.CreateName (createName) where

import Control.Monad.Reader
import Control.Monad.Trans.Maybe
import qualified Data.CreateName as Repository
import qualified Domain.CreateName.Command as Command
import Domain.CreateName.Context

makeContextItems :: ContextItems
makeContextItems =
  [ Repository Repository.createName,
    Command Command.createName
  ]

createName :: String -> Maybe String
createName input = do
  let maybeT = runMaybeT $ Command.createName input
  runReader maybeT makeContextItems
