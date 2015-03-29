React = require('react')

# Mixins
FluxibleMixin = require('fluxible').FluxibleMixin

# Actions
removeAlertAction = require('../../actions/alerts/removeAlert')

Component = React.createClass
  mixins: [FluxibleMixin]

  getDefaultProps: (props) ->
    type      : 'success'
    message   : ''

  onCloseAlert: () ->
    @executeAction removeAlertAction

  render: () ->

    (
      <div className="alert alert-#{@props.type} alert-dismissible" role="alert">
        <button type="button" className="close" aria-label="Close" onClick={@onCloseAlert}><span aria-hidden="true">&times;</span></button>
        {@props.message}
      </div>
    )

module.exports = Component
