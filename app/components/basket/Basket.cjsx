React = require('react')

BasketItem = require('./BasketItem')

Component = React.createClass

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
