createStore = require('fluxible/addons').createStore

Store = createStore
  storeName: 'ItemStore'
  handlers:
    'GET_ITEMS': 'handleGetItems'
    'ADD_ITEM': 'handleAddItem'
    'ADD_TO_BASKET': 'handleAddToBasket'
    'REMOVE_FROM_BASKET' : 'handleRemoveFromBasket'
    'EMPTY_BASKET': 'handleEmptyBasket'

  initialize: () ->
    @items = {}

  handleGetItems: (items) ->
    @items = items
    @emitChange()

  handleAddItem: (item) ->
    @item[item._id] = item
    @emitChange()

  handleAddToBasket: (key, item) ->
    console.log 'handleAddToBasket'
    @items[key] = item
    @emitChange()

  handleRemoveFromBasket: (key) ->
    console.log 'handleRemoveFromBasket'
    delete @items[key]
    @emitChange()

  handleEmptyBasket: () ->
    console.log 'handleEmptyBasket'
    @items = {}
    @emitChange()

  getState: () ->
    items: @items

  dehydrate: () ->
    @getState()

  rehydrate: (state) ->
    @items = state.items

module.exports = Store
