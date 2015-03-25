createStore = require('fluxible/addons').createStore
_ = require('underscore')

Store = createStore
  storeName: 'ItemStore'
  handlers:
    'GET_ITEMS': 'handleGetItems'
    'ADD_ITEM': 'handleAddItem'
    'REMOVE_ITEM': 'handleRemoveItem'
    'ADD_TO_BASKET': 'handleAddToBasket'
    'REMOVE_FROM_BASKET' : 'handleRemoveFromBasket'
    'EMPTY_BASKET': 'handleEmptyBasket'

  initialize: () ->
    @items = []
    @basket = []

  handleGetItems: (items) ->
    console.log 'items: ', items
    @items = items
    @emitChange()

  handleAddItem: (item) ->
    @items.push item
    @emitChange()

  handleRemoveItem: (item) ->
    @items.push item
    @emitChange()

  handleAddToBasket: (key, item) ->
    console.log 'handleAddToBasket'
    @basket.push(item);
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
