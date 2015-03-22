React = require('react')
Fluxible = require('fluxible')
routrPlugin = require('fluxible-plugin-routr')

Application = require('./components/Application')

app = new Fluxible
  component: React.createFactory(Application)

app.plug routrPlugin(
  routes: require('./routes')
)

app.registerStore require('./stores/ApplicationStore')

module.exports = app
