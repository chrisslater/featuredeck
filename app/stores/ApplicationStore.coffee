createStore = require('fluxible/addons').createStore
routesConfig= require('../routes')

Store = createStore
  storeName: 'ApplicationStore'

  handlers:
    'CHANGE_ROUTE_SUCCESS' : 'handleNavigate'
    'UPDATE_PAGE_TITLE'    : 'updatePageTitle'

  initialize: () ->
    @currentPageName = null
    @currentPage = null
    @currentRoute = null
    @pages = routesConfig
    @pageTitle = ''

  handleNavigate: (route) ->
    if @currentRoute and (@currentRoute.url == route.url)
      return

    pageName = route.config.page;
    page = @pages[pageName]

    @currentPageName = pageName
    @currentPage = page
    @currentRoute = route
    @emitChange()

  updatePageTitle: (title) ->
    @pageTitle = title.pageTitle
    @emitChange()

  getCurrentPageName: () ->
    @currentPageName

  getPageTitle: () ->
    @pageTitle

  getState: () ->
    currentPageName:  @currentPageName
    currentPage:      @currentPage
    pages:            @pages
    route:            @currentRoute
    pageTitle:        @pageTitle

  dehydrate: () ->
    @getState()

  rehydrate: (state) ->
    @currentPageName  = state.currentPageName
    @currentPage      = state.currentPage
    @pages            = state.pages
    @currentRoute     = state.route
    @pageTitle        = state.pageTitle


module.exports = Store
