
find  = (predicate) ->
  if this is null
    throw new TypeError 'Array.prototype.find called on null or undefined'

  if typeof predicate isnt 'function'
    throw new TypeError 'predicate must be a function'

  list    = Object(@)
  length  = list.length >>> 0
  thisArg = arguments[1]

  for index, item of list
    return item if (predicate.call thisArg, item, index, list)

  return undefined


Array.prototype.find  = find if not Array.prototype.find


module.exports  =
  find          : find
