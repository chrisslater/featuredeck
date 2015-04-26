module.exports = (context, payload, done) ->
  context.service.create 'features', payload, {}, (err, feature) ->
    context.dispatch 'ADD_ALERT',
      type: 'success'
      message: 'Feature submitted successfully'
