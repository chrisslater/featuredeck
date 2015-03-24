Item = require('../server/db').item

module.exports =
  # Name is the resource. Required.
  name: 'item'
  # At least one of the CRUD methods is Required
  read: (req, resource, params, config, callback) ->
    console.log 'Accessed Item'
    Item.find {}, (err, docs) ->
      callback null, docs

  # other methods
  # create: function(req, resource, params, body, config, callback) {},
  # update: function(req, resource, params, body, config, callback) {},
  # delete: function(req, resource, params, config, callback) {}
