createStore = require('fluxible/addons').createStore

Store = createStore
  storeName: 'FeaturesStore'

  handlers:
    'SET_FEATURES' : 'handleSetFeatures'

  handleSetFeatures: (features) ->
    @features = features
    @emitChange()

  getState: () ->
    features  :  @features

  dehydrate: () ->
    @getState()

  rehydrate: (state) ->
    @features = state.features

module.exports = Store
