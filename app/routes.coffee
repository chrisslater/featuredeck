setFeaturesAction = require './actions/features/setFeaturesFromDatabase'

module.exports =

  features:
    path: '/'
    method: 'get'
    page: 'features'
    label: 'features'
    action: (context, payload, done) ->
      context.dispatch 'UPDATE_PAGE_TITLE', { pageTitle: 'Features list' }
      context.executeAction setFeaturesAction, null, done

  featuresNew:
    path: '/new-feature'
    method: 'get'
    page: 'featuresNew'
    action: (context, payload, done) ->
      context.dispatch 'UPDATE_PAGE_TITLE', { pageTitle: 'Add new feature' }
      done()
