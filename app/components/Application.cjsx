React = require('react')

# Components
Nav = require('./Nav')
Alert = require('./alerts/Alert')
Features = require('./Features')

# Stores
ApplicationStore  = require('../stores/ApplicationStore')

# Mixins
RouterMixin = require('flux-router-component').RouterMixin
FluxibleMixin = require('fluxible').FluxibleMixin

Application = React.createClass
  displayName: 'Application'


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
      when 'home', 'features'
        output = <Features />
      when 'featuresNew'
        output = <Features featuresStartState="form" />

    return (
      <html id="application">
        <head>
          <meta charSet="utf-8" />
          <title>{@state.pageTitle}</title>
          <meta name="viewport" content="width=device-width, user-scalable=no" />

          <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
          <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css" />
        </head>
        <body>
          <div className="container">
            <Nav selected={@state.currentPageName} links={@state.pages} />
            {<Alert message={@state.alert.message} type={@state.alert.type} /> if @state.alert}
            <h1>{@state.pageTitle}</h1>
            {output}
          </div>
          <script dangerouslySetInnerHTML={{__html: @props.state}}></script>
          <script src="/js/bundle.js" defer></script>
          <script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
          <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        </body>
      </html>
    )

module.exports = Application
