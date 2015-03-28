createStore = require('fluxible/addons').createStore

Store = createStore
  storeName: 'UserStore'

  handlers:
    'SET_USER_STATE' : 'handleSetUserState'

  initialize: () ->
    @userState = false

  handleSetUserState: (state) ->
    @userState = state
    @emitChange()

  getUserState: () ->
    @userState

  getState: () ->
    userState:  @userState

  dehydrate: () ->
    @getState()

  rehydrate: (state) ->
    @userState  = state.userState

module.exports = Store
