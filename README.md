[![Build Status](https://travis-ci.org/scull7/empower-permission.svg?branch=master)](https://travis-ci.org/scull7/empower-permission)
[![Coverage Status](https://coveralls.io/repos/scull7/empower-permission/badge.svg?branch=master&service=github)](https://coveralls.io/github/scull7/empower-permission?branch=master)

# empower-permission
Given a permission set and a request return a permission token.

it will look in the `PermissionMap` for for a url that matches the given URL.
If found, then it will return the token string associated with that path.
Otherwise, it will return the `GeneralAccessToken` or  _'*'_.  

Paths will be parsed using the `pathToRegexp` module.

### PermissionToken

Example Token Strings:
```javascript
'token:entity:create'
'token:entity:update'
'token:entity:sub-entity:read'
```

### PermissionMap

This is a map of path strings to `PermissionTokens`

Example Map:
```json
{
  "/url/token/entity/:entityId": "url:token:entity",
  "/url/token/:tokenId": "url:token",
  "/url/token": "url:token:list",
  "/url/token/:tokenId/action": "url:token:action"
}
```
