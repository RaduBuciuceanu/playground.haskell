module Domain.GetNames.Command (getNames) where

import Domain.GetNames.Context

getNames :: GetNamesCommand
getNames parameter = do
  repository <- askRepository
  repository parameter
