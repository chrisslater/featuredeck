navigateAction = require('flux-router-component').navigateAction

module.exports = (context, payload, done) ->
  context.executeAction(navigateAction, {url: '/'})
  context.dispatch 'ADD_ALERT', { type: 'success', message: 'Feature submitted successfully' }
  done()
