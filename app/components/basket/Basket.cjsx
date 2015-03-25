React = require('react')
FluxibleMixin = require('fluxible').FluxibleMixin
ItemStore = require('../../stores/ItemStore')
getItems = require('../../actions/items/getItems')
createItem = require('../../actions/items/createItem')

BasketItem = require('./BasketItem')

Component = React.createClass
  mixins: [FluxibleMixin]

  statics:
    storeListeners: [ItemStore]

  getInitialState: () ->
    @getStore(ItemStore).getState()

  onChange: () ->
    @setState(@getStore(ItemStore).getState())

  onGetItemsClick: () ->
    @executeAction getItems

  onCreateItemClick: () ->
    @executeAction createItem, { name: 'w00t' } #TODO Get the prop items instead of hardcoding

  mapBasketItems: (items) ->
    Object.keys(items).map (key) ->
      item = items[key]

      if item
        return <BasketItem _id={item._id} name={item.name} quantity={item.quantity}>{item.name}</BasketItem>

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
