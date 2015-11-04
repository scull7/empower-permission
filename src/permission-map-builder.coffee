
Map = require './permission-map'

# mapFromJson :: JSON -> PermissionMap
mapFromJson = (json) ->
  map = []

  for path, token of json
    map = Map.addToken map, path, token

  return map

module.exports  =
  fromJson   : mapFromJson
