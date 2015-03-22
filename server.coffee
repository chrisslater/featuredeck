express         = require('express')
navigateAction  = require('flux-router-component').navigateAction
debug           = require('debug')('Example')
React           = require('react')
serialize       = require('serialize-javascript')
app             = require('./app/app')

HtmlComponent = React.createFactory(require('./app/components/Html'))

server = express()

server.use express.static('public')

server.use (req, res, next) ->
  context = app.createContext()
  debug 'Executing navigate action'

  context.executeAction navigateAction, { url: req.url }, (err) ->

    if err
      if err.status and err.status == 404
        next()
      else
        next(err)
      return

    debug 'Exposing context state'
    exposed = "window.App=#{serialize app.dehydrate(context)};"

    debug 'Rendering Application component into html'
    Component = app.getComponent()

    html = React.renderToStaticMarkup HtmlComponent(
      state: exposed
      markup: React.renderToString Component(
        context: context.getComponentContext()
      )
      context: context.getComponentContext()
    )

    debug 'Sending markup'
    res.send html

server.get '/', (req, res) ->
  res.render 'index'

module.exports =
  start: (options) ->
    server.listen(3000)
