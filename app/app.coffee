React = require('react')
Fluxible = require('fluxible')
routrPlugin = require('fluxible-plugin-routr')
fetchrPlugin = require('fluxible-plugin-fetchr');

Application = require('./components/Application')

app = new Fluxible
  component: React.createFactory(Application)

# context = app.createContext()
# loaderItemsAction = require('./actions/loaderItems')

# context.executeAction loaderItemsAction, {}, (err) ->
#   throw err if err


app.plug routrPlugin(
  routes: require('./routes')
)

app.plug fetchrPlugin(
  xhrPath: '/api' # Path for XHR to be served from
)

app.registerStore require('./stores/ApplicationStore')
app.registerStore require('./stores/ItemStore')

module.exports = app
