module.exports = (context, payload, done) ->
  context.dispatch 'REMOVE_ALERT'
  done()
