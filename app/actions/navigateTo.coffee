navigateAction = require('flux-router-component').navigateAction

module.exports = (context, payload, done) ->
  path = context.router.makePath payload.route
  context.executeAction navigateAction, {url: path}, done
