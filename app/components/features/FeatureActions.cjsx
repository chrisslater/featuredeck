React = require('react')

# Mixins
FluxibleMixin = require('fluxible').FluxibleMixin

# Actions
increaseCountAction = require('../../actions/features/increaseCount')
destroyFeatureAction = require('../../actions/features/destroyFeature')

Component = React.createClass
  displayName: 'FeatureActions'
  mixins: [FluxibleMixin]

  getDefaultProps: () ->
    anonText: 'Please login to use actions'

  onUpClick: () ->
    @executeAction increaseCountAction, id: @props.id

  onDownClick: () ->


  onDeleteClick: () ->
    @executeAction destroyFeatureAction, @props.id

  getCountControls: () ->
    [<a onClick={@onUpClick}>up</a>, <a onClick={@onDownClick}>down</a>]

  render: () ->
    (
      <div>
        {if @props.isLoggedIn then @getCountControls() else @props.anonText}
        {<a onClick={@onDeleteClick}>delete</a> if @props.isLoggedIn and @props.isAdmin}
      </div>
    )

module.exports = Component
