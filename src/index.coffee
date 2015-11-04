Map             = require './permission-map'
MapBuilder      = require './permission-map-builder'
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
  getToken: (path) -> Map.getToken @map, path


Factory = -> new PermissionMap()
Factory.fromJson  = (json) ->
  map           = MapBuilder.fromJson json
  permissionMap = new PermissionMap()
  permissionMap.map = map

  return permissionMap


module.exports  = Factory
