module Main where

import Control.Monad.Reader
import Control.Monad.Trans.Maybe
import Data.Map as Map

type Config = Map String Int

getConfig :: String -> MaybeT (Reader Config) Int
getConfig key = MaybeT $ do
  config <- ask
  return $ Map.lookup key config

getValues :: MaybeT (Reader Config) (Int, Int)
getValues = do
  a <- getConfig "a"
  b <- getConfig "b"
  return (a, b)

perform :: Maybe (Int, Int)
perform = do
  let maybe = runMaybeT getValues
  let config = fromList [("a", 1), ("b", 2)]
  runReader maybe config

main :: IO ()
main = do
  let result = perform

  putStrLn $ show foo 
