Map       = require  './permission-map.coffee'
Token     = require './permission-token.coffee'


getToken  = (map, url, action) ->

  token       = Map.getToken map, url
  tokenAction = Token.getAction token, action
