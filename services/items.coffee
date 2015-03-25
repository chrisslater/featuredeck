items = require('../server/db').items

module.exports =
  # Name is the resource. Required.
  name: 'items'
  # At least one of the CRUD methods is Required
  read: (req, resource, params, config, callback) ->

    items.find {}, (err, items) ->
      callback null, items

  # other methods
  create: (req, resource, params, body, config, callback) ->
    items.insert body, (err, item) ->
      callback null, item

  # update: function(req, resource, params, body, config, callback) {},
  delete: function(req, resource, params, config, callback) {
    console.log arguments
    # items.remove();

  }
