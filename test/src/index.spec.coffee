assert    = require 'assert'

Map       = require '../../src/index.coffee'

testJson  =
  "/url/token/entity/:entityId": "url:token:entity",
  "/url/token/:tokenId": "url:token",
  "/url/token": "url:token:list",
  "/url/token/:tokenId/action": "url:token:action"


testMap   = Map()
  .addToken '/my/test/path1', 'test:one'
  .addToken '/my/test/path2', 'test:two'
  .addToken '/my/test/:id/with/key', 'test:with:key'
  .addToken '/my/test/path3', 'test:three'
  .addToken '/my/test/with/action', 'test:with:action'


describe 'Empower Permision', ->

  describe 'getToken', ->

    it 'should return the found token with the added action from the given map',
      ->

      expected  = 'test:three'
      actual    = testMap.getToken '/my/test/path3'
      assert.equal actual, expected

    it 'should return the token with a custom action', ->

      expected  = 'test:with:action'
      actual    = testMap.getToken '/my/test/with/action'
      assert.equal actual, expected

  describe 'fromJson', ->

    it 'should return a map built from the given JSON object', ->

      map   = Map.fromJson testJson
      tests =
        '/url/token/entity/132' : 'url:token:entity'
        '/url/token/456'        : 'url:token'
        '/url/token'            : 'url:token:list'
        '/url/token/1234/action': 'url:token:action'

      assert.equal (map.getToken path), expected for path, expected of tests
