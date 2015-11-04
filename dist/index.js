// Generated by CoffeeScript 1.10.0
(function() {
  var DEFAULT_ACTION, Factory, Map, MapBuilder, PermissionMap;

  Map = require('./permission-map');

  MapBuilder = require('./permission-map-builder');

  DEFAULT_ACTION = '*';

  PermissionMap = (function() {
    function PermissionMap() {
      this.map = [];
    }

    PermissionMap.prototype.addToken = function(path, token) {
      this.map = Map.addToken(this.map, path, token);
      return this;
    };

    PermissionMap.prototype.getToken = function(path) {
      return Map.getToken(this.map, path);
    };

    return PermissionMap;

  })();

  Factory = function() {
    return new PermissionMap();
  };

  Factory.fromJson = function(json) {
    var map, permissionMap;
    map = MapBuilder.fromJson(json);
    permissionMap = new PermissionMap();
    permissionMap.map = map;
    return permissionMap;
  };

  module.exports = Factory;

}).call(this);
