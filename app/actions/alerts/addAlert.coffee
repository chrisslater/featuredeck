module.exports = (context, payload, done) ->
  context.dispatch 'ADD_ALERT', payload
  done()
