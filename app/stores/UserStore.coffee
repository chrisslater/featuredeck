createStore = require('fluxible/addons').createStore

Store = createStore
  storeName: 'UserStore'

  handlers:
    'SET_IS_LOGGED_IN' : 'handleSetIsLoggedIn'
    'SET_IS_ADMIN' : 'handleSetIsAdmin'

  initialize: () ->
    @isLoggedIn = false
    @isAdmin    = false

  handleSetIsLoggedIn: (isLoggedIn) ->
    @isLoggedIn = isLoggedIn
    @emitChange()

  handleSetIsAdmin: (isAdmin) ->
    @isAdmin = isAdmin
    @emitChange()

  getIsLoggedIn: () ->
    @isLoggedIn

  getIsAdmin: () ->
    @isAdmin

  getState: () ->
    isLoggedIn  :  @isLoggedIn
    isAdmin     :  @isAdmin

  dehydrate: () ->
    @getState()

  rehydrate: (state) ->
    @isLoggedIn = state.isLoggedIn
    @isAdmin    = state.isAdmin

module.exports = Store
