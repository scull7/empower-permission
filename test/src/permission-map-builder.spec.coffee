
assert        = require 'assert'
MapBuilder    = require '../../src/permission-map-builder'
PermissionMap = require '../../src/permission-map'

testJson      =
  "/url/token/entity/:entityId": "url:token:entity",
  "/url/token/:tokenId": "url:token",
  "/url/token": "url:token:list",
  "/url/token/:tokenId/action": "url:token:action"

describe 'Permission Map Builder', ->

  describe 'fromJson', ->

    it 'should build a permission map using the given JSON object.', ->

      map   = MapBuilder.fromJson testJson
      tests =
        '/url/token/entity/132' : 'url:token:entity'
        '/url/token/456'        : 'url:token'
        '/url/token'            : 'url:token:list'
        '/url/token/1234/action': 'url:token:action'

      for path, expected of tests
        actual = PermissionMap.getToken map, path
        assert.equal actual,expected
