module.exports =

  home:
    path: '/'
    method: 'get'
    page: 'home'
    label: 'Home'
    action: (context, payload, done) ->
      context.dispatch 'UPDATE_PAGE_TITLE', { pageTitle: 'Home | flux-examples | routing' }
      done()

  about:
    path: '/about'
    method: 'get'
    page: 'about'
    label: 'About'
    action: (context, payload, done) ->
      context.dispatch 'UPDATE_PAGE_TITLE', { pageTitle: 'About | flux-examples | routing' }
      done()
