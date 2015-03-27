React = require('react')
Fluxible = require('fluxible')
routrPlugin = require('fluxible-plugin-routr')
fetchrPlugin = require('fluxible-plugin-fetchr');

Application = require('./components/Application')

app = new Fluxible
  component: React.createFactory(Application)

app.plug routrPlugin(
  routes: require('./routes')
)

app.plug fetchrPlugin(
  xhrPath: '/api' # Path for XHR to be served from
)

app.registerStore require('./stores/ApplicationStore')

module.exports = app
