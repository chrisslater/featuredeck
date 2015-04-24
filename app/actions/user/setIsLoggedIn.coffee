module.exports = (context, payload, done) ->
  context.dispatch 'SET_IS_LOGGED_IN', payload.isLoggedIn
  done()
