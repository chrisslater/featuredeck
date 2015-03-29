module.exports = (context, payload, done) ->
  context.dispatch 'ADD_ALERT', { type: 'success', message: 'Feature submitted successfully' }
  done()
