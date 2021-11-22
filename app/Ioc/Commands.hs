module Ioc.Commands where

type GetNames = String -> [String]

type UpdateName = String -> String

type CreateName = String -> String

data Command
  = GetNames GetNames
  | UpdateName UpdateName
  | CreateName CreateName
