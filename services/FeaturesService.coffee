features = require('../server/db').features

module.exports =
    name: 'features',


    create: (req, resource, params, body, config, callback) ->
      features.insert params, (err, feature) ->
        callback(null, feature)

    read: (req, resource, params, config, callback) ->
      features.find params, (err, features) ->
        callback(null, features)

    # update: function(req, resource, params, body, config, callback) {},
    delete: (req, resource, id, config, callback) ->
      features.remove { _id: id}, (err) ->
        callback(null)
