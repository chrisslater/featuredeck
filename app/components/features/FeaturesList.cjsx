React = require('react')

Feature = require('./Feature')

Component = React.createClass

    getDefaultProps: (props) ->
      title: 'All features'
      loggedIn: false

    render: () ->

      (
        <div>
          <h2>{@props.title}</h2>

          <div className="row">
            <table className="table">
              <tr>
                <th>Feature name</th>
                <th>Count</th>
                <th>Actions</th>
              </tr>
              <Feature loggedIn={@props.loggedIn} />
            </table>
          </div>
        </div>
      )

  module.exports = Component
