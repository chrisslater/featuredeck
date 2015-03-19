React = require('react')

Nav = require('./NavComponent')

Application = React.createClass

  render: () ->
    (
      <div>
        <Nav />
        <h1>Application start</h1>
      </div>
    )

module.exports = Application
