createStore = require('fluxible/addons').createStore

Store = createStore
  storeName: 'ItemStore'
  handlers:
    'REMOVE_FROM_BASKET' : 'handleRemoveFromBasket'

  initialize: () ->

  handleRemoveFromBasket: () ->
    console.log 'handleRemoveFromBasket'

  getState: () ->

  dehydrate: () ->
    @getState()

  rehydrate: (state) ->


module.exports = Store
