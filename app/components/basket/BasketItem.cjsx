React = require('react')
removeAction = require('../../actions/items/removeItem')

Component = React.createClass
  contextTypes:
    executeAction: React.PropTypes.func.isRequired

  onRemoveClick: () ->
    @context.executeAction removeAction, @props

  render: () ->
    (
      <div className="basket-item">
        <div>Picture</div>
        <h2>{@props.name}</h2>
        <p><small>Quantity {@props.quantity}</small></p>
        <button onClick={@onRemoveClick}>Remove</button>
        <hr />
      </div>
    )

module.exports = Component
