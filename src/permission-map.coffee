pathToRegExp  = require 'path-to-regexp'

DEFAULT_TOKEN = "*"

# _match :: String -> String -> Bool
_match  = (url, path) -> pathToRegExp(path).test url

# type alias PermissionMap = Object
PermissionMap = (map  = {}) -> map

# addToken :: PermissionMap -> String -> PermissionToken -> PermissionMap
addToken  = (map, path, token) ->
  map[path] = token
  map

# getToken :: PermissionMap -> String -> PermissionToken
getToken  = (map, url) ->
  (token for path, token of map when _match url, path)[0] or DEFAULT_TOKEN

module.exports  =
  PermissionMap : PermissionMap
  addToken      : addToken
  getToken      : getToken
