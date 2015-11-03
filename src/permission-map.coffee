pathToRegExp  = require 'path-to-regexp'

DEFAULT_TOKEN = '*'


# _match :: String -> Permission -> Bool
_match  = (path, perm) -> pathToRegExp(perm.path).test path


# Permission :: String -> String -> { path: String, token: String }
Permission = (path, token) ->
  path  : path
  token : token


# addToken :: PermissionMap -> String -> String -> PermissionMap
addToken  = (map, path, token) -> map.concat [ (Permission path, token) ]


# getToken :: PermissionMap -> String -> Permission
getToken  = (map, path) ->
  for perm in map when _match(path, perm)
    return perm.token

  return DEFAULT_TOKEN


module.exports  =
  Permission    : Permission
  addToken      : addToken
  getToken      : getToken
