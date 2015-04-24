createStore = require('fluxible/addons').createStore

Store = createStore
  storeName: 'FeaturesStore'

  handlers:
    'SET_FEATURES' : 'handleSetFeatures'

  initialize: () ->
    @features = [{
      title: 'Add shizzle to the nizzle'
      count: 4
    }, {
      title: 'Remove sizzle from the dizzle'
      count: 10
    }, {
      title: 'Set ya pizzle'
      count: 5
    }]

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
