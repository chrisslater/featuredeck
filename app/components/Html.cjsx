React = require('react')
ApplicationStore = require('../stores/ApplicationStore')
FluxibleMixin = require('fluxible').FluxibleMixin

Html = React.createClass
  mixins: [FluxibleMixin]

  render: () ->

    # pageTitle = @getStore(ApplicationStore).getPageTitle()
    # content = this.props.children

    (
      <html>
        <head>
          <meta charSet="utf-8" />
          <title>{@props.pageTitle}</title>
          <meta name="viewport" content="width=device-width, user-scalable=no" />
        </head>
        <body>
          {@props.children}
          # <div dangerouslySetInnerHTML={{__html: @props.markup}}></div>
        </body>
        # <script dangerouslySetInnerHTML={{__html: @props.state}}></script>
        <script src="/js/bundle.js" defer></script>
      </html>
    )

module.exports = Html
