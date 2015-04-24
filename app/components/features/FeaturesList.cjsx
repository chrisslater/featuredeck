React = require('react')

Feature = require('./Feature')

Component = React.createClass
  displayName: 'FeaturesList'

  getDefaultProps: () ->
    title     : 'All features'
    features  : []

  getFeatures: () ->
    output = []

    for feature in @props.features
      output.push <Feature isLoggedIn={@props.isLoggedIn} isAdmin={@props.isAdmin} title={feature.title} count={feature.count} />

    output

  render: () ->

    (
      <div>
        <h2>{@props.title}</h2>

        <div className="row">
          <table className="table">
            <tr>
              <th>Feature title</th>
              <th>Count</th>
              <th>Actions</th>
            </tr>
            {@getFeatures()}
          </table>
        </div>
      </div>
    )

module.exports = Component
