React = require('react')

# Mixins
FluxibleMixin = require('fluxible').FluxibleMixin

# Stores
UserStore = require('../../stores/UserStore')

# Actions
loginAction = require('../../actions/user/login')
logoutAction = require('../../actions/user/logout')

Component = React.createClass
  mixins: [FluxibleMixin]

  statics:
    storeListeners: [UserStore]

  getInitialState: () ->
    @getUserStoreState()

  onChange: () ->
    @setState @getUserStoreState()

  getUserStoreState: () ->
    @getStore(UserStore).getState()

  onLoginClick: () ->
    @executeAction loginAction, true

  onLogoutClick: () ->
    @executeAction logoutAction, false

  render: () ->
    stateText = if @state.userState then 'in' else 'out'

    return (
      <div className="navbar-text navbar-right">
        <button className="btn btn-default navbar-btn" onClick={@onLoginClick}>Login</button>
        <button className="btn btn-default navbar-btn" onClick={@onLogoutClick}>Logout</button>
        <span>You are logged {stateText}</span>
      </div>
    )

module.exports = Component
