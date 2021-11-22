module Main where

import Control.Monad.Reader
import qualified Data.CreateName
import qualified Data.GetNames
import qualified Data.UpdateName
import qualified Domain.GetNames
import qualified Ioc.Commands as Commands
import qualified Ioc.Container as Ioc
import qualified Ioc.Repositories as Repositories

container :: Ioc.Container
container =
  [ Ioc.Command (Commands.GetNames Domain.GetNames.getNames),
    Ioc.Repository (Repositories.CreateName Data.CreateName.createName),
    Ioc.Repository (Repositories.UpdateName Data.UpdateName.updateName),
    Ioc.Repository (Repositories.GetNames Data.GetNames.getNames)
  ]

innerPerform :: ReaderT Ioc.Container IO ()
innerPerform = do
  container <- ask

  liftIO $ putStrLn "Hey from inside innerPerform..."

perform :: ReaderT Ioc.Container IO ()
perform = do
  container <- ask
  let Ioc.Command command = head container
  let Commands.GetNames getNames = command
  let name = head $ getNames "parameter"

  liftIO $ putStrLn name
  innerPerform

main :: IO ()
main = do
  runReaderT perform container
