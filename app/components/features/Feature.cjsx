React = require('react')

FeatureActions = require('./FeatureActions')

Component = React.createClass
  displayName: 'Feature'

  getDefaultProps: () ->
    name: '<< Feature name >>'
    count: 0

  render: () ->
    (
      <tr>
        <td>
          {@props.name}
        </td>
        <td>
          {@props.count}
        </td>
        <td>
          <FeatureActions isLoggedIn={@props.isLoggedIn} isAdmin={@props.isAdmin} />
        </td>
      </tr>
    )

module.exports = Component
