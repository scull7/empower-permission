
assert  = require 'assert'
Map     = require '../../src/permission-map.coffee'

describe 'Permission Map', ->

  describe 'addToken', ->

    it 'should add the given path and token to the given map object', ->

      testMap   = [
        Map.Permission '/test', 'test'
      ]

      expected  = [
        Map.Permission '/test', 'test'
        Map.Permission '/added', 'added'
      ]

      actual    = Map.addToken testMap, '/added', 'added'
      assert.deepEqual actual, expected

  describe 'getToken', ->

    it 'should return a matching token when found', ->

      testMap   = [
        Map.Permission '/not/my/token', 'not:my-token'
        Map.Permission '/my/found/token', 'my:found:token'
        Map.Permission '/also/not/mine', 'also:not:mine'
      ]

      expected  = 'my:found:token'
      actual    = Map.getToken testMap, '/my/found/token'
      assert.deepEqual actual, expected

    it 'should return the default token when a matching path is not found', ->

      testMap   = [
        Map.Permission '/not/my/token', 'not:my-token'
        Map.Permission '/my/found/token', 'my:found:token'
        Map.Permission '/also/not/mine', 'also:not:mine'
      ]

      expected  = '*'
      actual    = Map.getToken testMap, '/does/not/exist'
      assert.deepEqual actual, expected
