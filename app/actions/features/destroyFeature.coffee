setFeaturesAction = require './setFeaturesFromDatabase'

module.exports = (context, payload, done) ->
  console.log payload
  context.service.delete 'features', payload, {}, (err) ->

    context.dispatch 'ADD_ALERT',
      type: 'success'
      message: 'Feature deleted successfully'

    context.executeAction setFeaturesAction, null, done
