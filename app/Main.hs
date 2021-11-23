module Main where

import Control.Monad.Reader
import Control.Monad.Trans.Maybe
import Data.Map as Map

type Config = Map String Int

getConfig :: String -> MaybeT (Reader Config) Int
getConfig key = MaybeT $ do
  configs <- ask
  return $ Map.lookup key configs

getValues :: MaybeT (Reader Config) (Int, Int)
getValues = do
  a <- getConfig "a"
  b <- getConfig "b"
  return (a, b)

perform :: Maybe (Int, Int)
perform = do
  let config = fromList [("a", 1), ("b", 2)]
  runReader (runMaybeT getValues) config

main :: IO ()
main = do
  let result = perform

  case result of
    Just value -> print $ show value
    Nothing -> print "Hello"
