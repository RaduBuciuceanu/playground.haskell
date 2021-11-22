module Ioc.Container where

import Data.List
import Data.Typeable
import Ioc.Commands
import Ioc.Repositories

data Dependency
  = Repository Repository
  | Command Command

type Container = [Dependency]

matchType :: (Typeable dependencyType, Typeable valueType) => dependencyType -> valueType -> Bool
matchType dependencyType value =
  typeOf value == typeOf dependencyType

askDependency :: (Typeable dependencyType) => Container -> dependencyType -> Maybe Dependency
askDependency container dependencyType =
  find (matchType dependencyType) container
