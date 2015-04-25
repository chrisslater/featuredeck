React = require('react')

# Mixins
FluxibleMixin = require('fluxible').FluxibleMixin

# Actions
destroyFeatureAction = require('../../actions/features/destroyFeature')

Component = React.createClass
  displayName: 'FeatureActions'
  mixins: [FluxibleMixin]

  getDefaultProps: () ->
    anonText: 'Please login to use actions'

  onDeleteClick: () ->
    @executeAction destroyFeatureAction, @props.id

  getCountControls: () ->
    [<a>up</a>, <a>down</a>]

  render: () ->
    (
      <div>
        {if @props.isLoggedIn then @getCountControls() else @props.anonText}
        {<a onClick={@onDeleteClick}>delete</a> if @props.isLoggedIn and @props.isAdmin}
      </div>
    )

module.exports = Component
