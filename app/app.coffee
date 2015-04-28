React = require('react')
Fluxible = require('fluxible')
routrPlugin = require('fluxible-plugin-routr')
fetchrPlugin = require('fluxible-plugin-fetchr');
alertsPlugin = require('alerts').Plugin;

Application = require('./components/Application')

app = new Fluxible
  component: React.createFactory(Application)

app.plug routrPlugin(
  routes: require('./routes')
)

app.plug fetchrPlugin(
  xhrPath: '/api' # Path for XHR to be served from
)

console.log alertsPlugin

# app.plug alertsPlugin(
#   foo: 'bar'
# )

app.registerStore require('./stores/ApplicationStore')
app.registerStore require('./stores/UserStore')
app.registerStore require('./stores/FeaturesStore')

module.exports = app
