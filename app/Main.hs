module Main where

import Control.Monad.Reader
import Data.CreateName as CreateNameRepository
import Data.GetNames as GetNamesRepository
import Data.UpdateName as UpdateNameRepository
import Domain.GetNames as GetNamesCommand
import Ioc.Commands as Commands
import Ioc.Container
import qualified Ioc.Container as Commands
import qualified Ioc.Container as Repositories
import Ioc.Repositories as Repositories

container :: Container
container =
  [ Commands.Command (Commands.GetNames GetNamesCommand.getNames),
    Repositories.Repository (Repositories.CreateName CreateNameRepository.createName),
    Repositories.Repository (Repositories.UpdateName UpdateNameRepository.updateName),
    Repositories.Repository (Repositories.GetNames GetNamesRepository.getNames)
  ]

doSomething :: ReaderT Container IO ()
doSomething = do
  container <- ask
  let Commands.Command command = head container
  let Commands.GetNames getNames = command
  let foo = getNames ""

  liftIO $ putStr $ head foo
  liftIO $ putStr "Hello"

main :: IO ()
main = do
  runReaderT doSomething container
