React = require('react')

FeatureActions = require('./FeatureActions')

Component = React.createClass
  displayName: 'Feature'

  getDefaultProps: () ->
    title: '<< Feature name >>'
    count: 0

  render: () ->
    (
      <tr>
        <td>
          {@props.title}
        </td>
        <td>
          {@props.count}
        </td>
        <td>
          <FeatureActions isLoggedIn={@props.isLoggedIn} isAdmin={@props.isAdmin} id={@props.id} />
        </td>
      </tr>
    )

module.exports = Component
