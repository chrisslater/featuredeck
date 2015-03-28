module.exports =

  home:
    path: '/'
    method: 'get'
    page: 'home'
    label: 'Home'
    action: (context, payload, done) ->
      context.dispatch 'SET_USER_STATE', false
      context.dispatch 'UPDATE_PAGE_TITLE', { pageTitle: 'Home | flux-examples | routing' }
      done()
