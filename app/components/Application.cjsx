React = require('react')

Nav = require('./Nav')
Home = require('./Home')
About = require('./About')

ApplicationStore = require('../stores/ApplicationStore')
RouterMixin = require('flux-router-component').RouterMixin
FluxibleMixin = require('fluxible').FluxibleMixin

Application = React.createClass
  mixins: [RouterMixin, FluxibleMixin]

  statics:
    storeListeners: [ApplicationStore]

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
      <div>
        <Nav selected={@state.currentPageName} links={@state.pages} />
        <h1>{@state.pageTitle}</h1>
        {output}
      </div>
    )

module.exports = Application
