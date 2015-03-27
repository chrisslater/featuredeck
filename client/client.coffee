React = require('react')
debug = require('debug')
bootstrapDebug = debug('Example')
app = require('../app/app')

dehydratedState = window.App # Sent from the server

window.React = React # For chrome dev tool support
debug.enable '*'

bootstrapDebug 'rehydrating app'

app.rehydrate dehydratedState, (err, context) ->
  throw err if err

  window.context = context
  mountNode = document.getElementById 'application'

  bootstrapDebug 'React Rendering'
  Component = app.getComponent()
  React.render Component({ context: context.getComponentContext() }), mountNode, () ->
    bootstrapDebug 'React Rendered'
