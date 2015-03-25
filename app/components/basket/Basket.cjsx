React = require('react')
FluxibleMixin = require('fluxible').FluxibleMixin
ItemStore = require('../../stores/ItemStore')
loaderItems = require('../../actions/loaderItems')
createItem = require('../../actions/items/createItem')

BasketItem = require('./BasketItem')

Component = React.createClass
  mixins: [FluxibleMixin]

  statics:
    storeListeners: [ItemStore]

  getInitialState: () ->
    @getStore(ItemStore).getState()

  onChange: () ->
    @getStore(ItemStore).getState()

  onGetItemsClick: () ->
    @executeAction loaderItems

  onCreateItemClick: () ->
    @executeAction createItem, { name: 'w00t' }

  mapBasketItems: (items) ->
    Object.keys(items).map (key) ->
      item = items[key]

      if item
        return <BasketItem key={key} name={item.name} quantity={item.quantity}>{item.name}</BasketItem>


      return ''


  render: () ->

    items = @getStore(ItemStore).getState().items
    basketItems = @mapBasketItems items

    (
      <div>
        <h2>Basket</h2>
        <button onClick={@onGetItemsClick}>Load items</button>
        <button onClick={@onCreateItemClick}>Create new item</button>
        <div>
          {basketItems}
        </div>
      </div>
    )

module.exports = Component
