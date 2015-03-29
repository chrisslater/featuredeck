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

  onToggleState: () ->
    if @state.userState
      @onLogoutClick()
    else
      @onLoginClick()

  onLoginClick: () ->
    @executeAction loginAction, true

  onLogoutClick: () ->
    @executeAction logoutAction, false

  render: () ->
    stateText = if @state.userState then 'Logout' else 'Login'

    return (
      <div className="navbar-text navbar-right">
        <button className="btn btn-default navbar-btn" onClick={@onToggleState}>{stateText}</button>
      </div>
    )

module.exports = Component
