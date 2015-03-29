React = require('react')

FeatureActions = require('./FeatureActions')

Component = React.createClass

  getDefaultProps: (props) ->
    name: 'Feature Placholder text'
    count: 1000
    loggedIn: false

  getActions: () ->
    output =  if @props.loggedIn then <FeatureActions /> else 'Please login to use actions'

  render: () ->

    actions = @getActions()

    (
      <tr>
        <td>
          {@props.name}
        </td>
        <td>
          {@props.count}
        </td>
        <td>
          {actions}
        </td>
      </tr>
    )

module.exports = Component
