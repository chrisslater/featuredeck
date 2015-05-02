module.exports = (context, payload, done) ->
  context.service.create 'features', payload, {}, (err, feature) ->
    console.log context.alert
    context.alert.add
      type: 'success'
      message: 'Feature submitted successfully'
