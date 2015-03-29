navigateAction = require('flux-router-component').navigateAction

module.exports = (context, payload, done) ->
  context.dispatch 'ADD_ALERT',
    type: 'success'
    message: 'Feature submitted successfully'

  path = context.router.makePath 'features'
  context.executeAction navigateAction, {url: path}, done
