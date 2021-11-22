module Ioc.Repositories where

type CreateName = String -> String

type UpdateName = String -> String

type GetNames = String -> [String]

data Repository
  = CreateName CreateName
  | UpdateName UpdateName
  | GetNames GetNames
