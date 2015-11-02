assert  = require 'assert'

{
  Map
}       = require '../../src/index.coffee'


testMap = Map()
  .addToken '/my/test/path1', 'test:one'
  .addToken '/my/test/path2', 'test:two'
  .addToken '/my/test/:id/with/key', 'test:with:key'
  .addToken '/my/test/path3', 'test:three'
  .addToken '/my/test/with/action', 'test:with:action!'


describe 'Empower Permision', ->

  describe 'getToken', ->

    it 'should return the found token with the added action from the given map',
      ->

      expected  = 'test:three:get'
      actual    = testMap.getToken '/my/test/path3', 'get'
      assert.equal actual, expected

    it 'should return the token with a custom action', ->

      expected  = 'test:with:action'
      actual    = testMap.getToken '/my/test/with/action', 'get'
      assert.equal actual, expected
