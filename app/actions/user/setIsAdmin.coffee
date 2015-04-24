module.exports = (context, payload, done) ->
  context.dispatch 'SET_IS_ADMIN', payload.isAdmin
  done()
