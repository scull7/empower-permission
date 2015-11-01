
assert  = require 'assert'
Map     = require '../../src/permission-map.coffee'

describe 'Permission Map', ->

  describe 'PermissionMap', ->

    it 'should return an empty object with called without a parameter', ->

      expected  = {}
      actual    = Map.PermissionMap()
      assert.deepEqual actual, expected

    it 'should just return the given object.', ->

      expected  = { test: 42 }
      actual    = Map.PermissionMap { test: 42 }
      assert.deepEqual actual, expected

  describe 'addToken', ->

    it 'should add the given path and token to the given map object', ->

      expected  =
        '/test': 'test'
        '/added': 'added'

      actual    = Map.addToken { '/test' : 'test' }, '/added', 'added'
      assert.deepEqual actual, expected

  describe 'getToken', ->

    it 'should return a matching token when found', ->

      testMap   =
        '/not/my/token'   : 'not:my-token'
        '/my/found/token' : 'my:found:token'
        '/also/not/mine'  : 'also:not:mine'

      expected  = 'my:found:token'
      actual    = Map.getToken testMap, '/my/found/token'
      assert.deepEqual actual, expected

    it 'should return the default token when a matching path is not found', ->


      testMap   =
        '/not/my/token'   : 'not:my-token'
        '/my/found/token' : 'my:found:token'
        '/also/not/mine'  : 'also:not:mine'

      expected  = '*'
      actual    = Map.getToken testMap, '/does/not/exist'
      assert.deepEqual actual, expected
