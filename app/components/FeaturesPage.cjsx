React = require('react')
merge = require('merge')

# Components
Features = require('./features/Features')

# Mixins
FluxibleMixin = require('fluxible').FluxibleMixin

# Stores
UserStore = require('../stores/UserStore')
FeaturesStore     = require('../stores/FeaturesStore')

Page = React.createClass
  displayName: 'FeaturesPage'
  mixins: [FluxibleMixin]

  statics:
    storeListeners:
      onUserStoreChange: [UserStore]
      onFeaturesStoreChange: [FeaturesStore]

  getDefaultProps: () ->
    featuresStartState: 'list'

  getInitialState: () ->
    featuresStoreState = @getFeaturesStoreState()
    console.log 'getInitialState', featuresStoreState
    merge @getUserStoreState(), featuresStoreState

  onUserStoreChange: () ->
    @setState @getUserStoreState()

  onFeaturesStoreChange: () ->
    @setState @getFeaturesStoreState()

  getUserStoreState: () ->
    @getStore(UserStore).getState()

  getFeaturesStoreState: () ->
    @getStore(FeaturesStore).getState()

  render: () ->

    return (
      <div>
        <Features isLoggedIn={@state.isLoggedIn} isAdmin={@state.isAdmin} features={@state.features} start={@props.featuresStartState} />
      </div>
    )

module.exports = Page
