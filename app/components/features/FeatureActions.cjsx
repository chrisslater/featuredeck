React = require('react')

Component = React.createClass
  displayName: 'FeatureActions'

  getDefaultProps: () ->
    anonText: 'Please login to use actions'

  getCountControls: () ->
    [
      <a>up</a>,
      <a>down</a>
    ]

  render: () ->
    (
      <div>
        {if @props.isLoggedIn then @getCountControls() else @props.anonText}
        {<a>delete</a> if @props.isLoggedIn and @props.isAdmin}
      </div>
    )

module.exports = Component
