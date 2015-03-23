React = require('react')

Component = React.createClass
  getDefaultProps: () ->
    quantity: 1

  render: () ->
    (
      <div class="basket-item">
        <div>Picture</div>
        <h2>Description text stuff</h2>
        <p><small>Quantity {@props.quantity}</small></p>
        <hr />
      </div>
    )

module.exports = Component
