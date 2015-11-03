
assert    = require 'assert'
polyfill  = require '../../src/polyfill.coffee'

describe 'Polyfill', ->

  describe 'find', ->

    it 'should return undefined when an item is not found.', ->

      testArr   = [ 'one', 'two', 'three' ]
      testP     = (item) -> item is 'four'

      assert.equal polyfill.find.call(testArr, testP), undefined

    it 'should throw a TypeError when called on null', ->

      testP = (item) -> item is 'four'

      try
        polyfill.find.call(null, testP)
      catch e
        assert.equal(
          e.message,
          'Array.prototype.find called on null or undefined'
        )


    it 'should throw a TypeError when called on undefined', ->

      testP = (item) -> item is 'four'

      try
        polyfill.find.call(undefined, testP)
      catch e
        assert.equal(
          e.message,
          'Array.prototype.find called on null or undefined'
        )

    it 'should throw a TypeError when the predicate is not a function', ->

      try
        polyfill.find.call([], test: null )
      catch e
        assert.equal e.message, 'predicate must be a function'

    it 'should return the found item', ->

      testArr = [ 'one', 'three', 'four', 'two' ]
      testP   = (item) -> item is 'four'

      assert.equal (polyfill.find.call testArr, testP), 'four'
