module.exports =

  features:
    path: '/'
    method: 'get'
    page: 'features'
    label: 'features'
    action: (context, payload, done) ->
      context.dispatch 'UPDATE_PAGE_TITLE', { pageTitle: 'Home | flux-examples | routing' }
      done()

  featuresNew:
    path: '/new-feature'
    method: 'get'
    page: 'featuresNew'
    action: (context, payload, done) ->
      context.dispatch 'UPDATE_PAGE_TITLE', { pageTitle: 'Add new feature' }
      done()
