module.exports = (context, payload, done) ->
  context.dispatch('SET_USER_STATE', false);
  done()
