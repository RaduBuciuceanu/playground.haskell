module Domain.CreateName.Command (createName) where

import Domain.CreateName.Context

createName :: String -> Context String
createName input = do
  repository <- askRepository
  repository input
