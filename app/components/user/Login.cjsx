React = require('react')

# Mixins
FluxibleMixin = require('fluxible').FluxibleMixin

# Stores
UserStore = require('../../stores/UserStore')

# Actions
setIsLoggedInAction = require('../../actions/user/setIsLoggedIn')
setIsAdminAction = require('../../actions/user/setIsAdmin')

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

  onToggleIsLoggedInClick: () ->
    if @state.isLoggedIn
      @setIsLoggedIn false
    else
      @setIsLoggedIn true

  onToggleIsAdminClick: () ->
    if @state.isAdmin
      @setIsAdmin false
    else
      @setIsAdmin true

  setIsLoggedIn: (state) ->
    @executeAction setIsLoggedInAction, { isLoggedIn: state }

  setIsAdmin: (state) ->
    @executeAction setIsAdminAction, { isAdmin: state }

  render: () ->
    isLoggedInText = if @state.isLoggedIn then 'Logout' else 'Login'
    isAdminText = if @state.isAdmin then 'Normal' else 'Admin'

    return (
      <div className="navbar-text navbar-right">
        {<button className="btn btn-default navbar-btn" onClick={@onToggleIsAdminClick}>{isAdminText}</button> if @state.isLoggedIn}
        <button className="btn btn-default navbar-btn" onClick={@onToggleIsLoggedInClick}>{isLoggedInText}</button>
      </div>
    )

module.exports = Component
