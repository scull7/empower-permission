Map             = require  './permission-map.coffee'
Token           = require './permission-token.coffee'
DEFAULT_ACTION  = '*'


# type alias PermissionMap = Array Permission
class PermissionMap


  # PermissionMap :: PermissionMap
  constructor: -> @map = []


  # addToken :: String -> String -> PermissionMap
  addToken: (path, token) ->
    @map   = Map.addToken @map, path, token
    return @


  # getToken :: String -> String -> String
  getToken: (path, action) ->
    token   = Map.getToken @map, path
    tokenAction = Token.getAction token, action

    return (if tokenAction is action
      (Token.addAction token, action)
    else token).replace /!/g, ''


module.exports  =
  Map           : -> new PermissionMap()
  Permission    : Map.Permission
