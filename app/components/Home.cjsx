React = require('react')

# Mixins
FluxibleMixin = require('fluxible').FluxibleMixin

# Stores
UserStore = require('../stores/UserStore')

Page = React.createClass
  mixins: [FluxibleMixin]

  statics:
    storeListeners: [UserStore]

  getInitialState: () ->
    @getUserStoreState()

  onChange: () ->
    @setState @getUserStoreState()

  getUserStoreState: () ->
    @getStore(UserStore).getState()

  render: () ->
    stateText = if @state.userState then 'in' else 'out'

    return (
      <div>
        <h2>Hello world</h2>
        <p>You are in a logged {stateText} state</p>
      </div>
    )

module.exports = Page
