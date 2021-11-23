module Presentation.GetNames (getNames) where

import Control.Monad.Reader
import Control.Monad.Trans.Maybe
import qualified Data.GetNames as Repository
import qualified Domain.GetNames.Command as Command
import Domain.GetNames.Context

makeContextItems :: ContextItems
makeContextItems =
  [ Repository Repository.getNames,
    Command Command.getNames
  ]

getNames :: String -> Maybe [String]
getNames parameter = do
  let maybeT = runMaybeT $ Command.getNames parameter
  runReader maybeT makeContextItems
