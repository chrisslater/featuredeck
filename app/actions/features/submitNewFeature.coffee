module.exports = (context, payload, done) ->
  context.service.create 'features', payload, {}, (err, feature) ->
    context.alert.add
      type: 'success'
      message: 'Feature submitted successfully'
