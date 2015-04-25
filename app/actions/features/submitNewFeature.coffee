navigateAction = require('flux-router-component').navigateAction
features = require('../../../server/db').features;

module.exports = (context, payload, done) ->
  window.features = features

  context.service.create 'features', payload, {}, (err, feature) ->

    context.dispatch 'ADD_ALERT',
      type: 'success'
      message: 'Feature submitted successfully'

    path = context.router.makePath 'features'
    context.executeAction navigateAction, {url: path}, done
