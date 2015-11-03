[![Build Status](https://travis-ci.org/scull7/empower-permission.svg?branch=master)](https://travis-ci.org/scull7/empower-permission)
[![Coverage Status](https://coveralls.io/repos/scull7/empower-permission/badge.svg?branch=master&service=github)](https://coveralls.io/github/scull7/empower-permission?branch=master)

# empower-permission 
Given a permission set and a request return a permission token.

it will look in the `PermissionMap` for for a url that matches the given URL.
If found, then it will return the `BasePermissionToken` associated with that URL.
Otherwise, it will return the `GeneralAccessToken` or  _'*'_.  

Once it has the base permission token then it will append the interpreted `Method`
_(Action)_ to the token using a `:` character separator.

### PermissionToken

Example Token Strings:
```
'token:entity:create`
`token:entity:update`
`token:entity:sub-entity:read`
```
***NOTE*** what precedes the `:<action>` is entirely up to what you put in the
`PermissionMap` you provide.

### PermissionMap

This is a map of URL strings to `PermissionTokens`
  
Example Map:
```
{
  "url/token/entity": "token:entity",
  "url/token/entity/action": "token:entity:action!"
}
```
***Note*** adding `!` to the end of your token marks anything after the last
`:` as an action.
  
  
### Method
  
This is either an HTTP Method or a custom action.  It will be interpreted 
into one of the following:

- ***READ*** _(GET)_
- ***WRITE*** _(POST / PUT)_
- ***CREATE*** _(POST)_
- ***UPDATE*** _(PUT)_
- ***DELETE*** _(DELETE)_
- ***CUSTOM ACTION***


