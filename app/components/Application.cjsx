React = require('react')

# Components
Nav = require('./Nav')
Home = require('./Home')
Login = require('./user/Login')

# Stores
ApplicationStore = require('../stores/ApplicationStore')

# Mixins
RouterMixin = require('flux-router-component').RouterMixin
FluxibleMixin = require('fluxible').FluxibleMixin

Application = React.createClass
  mixins: [RouterMixin, FluxibleMixin]

  statics:
    storeListeners: [ApplicationStore]

  getDefaultProps: () ->
    state: {}

  getInitialState: () ->
    @getApplicationState()

  onChange: () ->
    @setState @getApplicationState()

  getApplicationState: () ->
    @getStore(ApplicationStore).getState()

  render: () ->
    output = ''

    switch @state.currentPageName
      when 'home'
        output = <Home />

      when 'about'
        output = <About />

    return (
      <html id="application">
        <head>
          <meta charSet="utf-8" />
          <title>{@state.pageTitle}</title>
          <meta name="viewport" content="width=device-width, user-scalable=no" />
        </head>
        <body>
          <Login />
          <div>
            <Nav selected={@state.currentPageName} links={@state.pages} />
            <h1>{@state.pageTitle}</h1>
            {output}
          </div>
          <script dangerouslySetInnerHTML={{__html: @props.state}}></script>
          <script src="/js/bundle.js" defer></script>
        </body>
      </html>
    )

module.exports = Application
