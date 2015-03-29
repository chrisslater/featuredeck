React = require('react')

# Components
Features = require('./features/Features')

# Mixins
FluxibleMixin = require('fluxible').FluxibleMixin

# Stores
UserStore = require('../stores/UserStore')

Page = React.createClass
  mixins: [FluxibleMixin]

  statics:
    storeListeners: [UserStore]

  getDefaultProps: (props) ->
    featuresStartState: 'list'

  getInitialState: () ->
    @getUserStoreState()

  onChange: () ->
    @setState @getUserStoreState()

  getUserStoreState: () ->
    @getStore(UserStore).getState()

  render: () ->

    return (
      <div>
        <Features loggedIn={@state.userState} start={@props.featuresStartState} />
      </div>
    )

module.exports = Page
