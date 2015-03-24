React = require('react')
FluxibleMixin = require('fluxible').FluxibleMixin
ItemStore = require('../../stores/ItemStore')

BasketItem = require('./BasketItem')

Component = React.createClass
  mixins: [FluxibleMixin]

  statics:
    storeListeners: [ItemStore]

  getInitialState: () ->
    @getStore(ItemStore).getState()

  render: () ->


    (
      <div>
        <h2>Basket</h2>
        <div>
          <BasketItem  />
          <BasketItem quantity={2} />
        </div>
      </div>
    )

module.exports = Component
