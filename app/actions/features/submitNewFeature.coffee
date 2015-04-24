navigateAction = require('flux-router-component').navigateAction
features = require('../../../server/db').features;

module.exports = (context, payload, done) ->

  features.insert ({ title: 'TEST'}, (err, newDoc) ->
    console.log 'newDoc', newDoc

    context.dispatch 'ADD_ALERT',
      type: 'success'
      message: 'Feature submitted successfully'

    path = context.router.makePath 'features'
    context.executeAction navigateAction, {url: path}, done
  )
