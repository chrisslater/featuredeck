React = require('react')
Basket = require('./basket/Basket')

Page = React.createClass

  getInitialState: () ->
    return {}

  render: () ->
    return (
      <Basket />
    )

module.exports = Page
