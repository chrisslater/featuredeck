React = require('react')

FeaturesList = require('./FeaturesList')
FeaturesForm = require('./FeaturesForm')

Component = React.createClass

    getDefaultProps: () ->
      loggedIn: false

    render: () ->

      (
        <div>
          <ul className="nav nav-tabs">
            <li className="active"><a>All features</a></li>
            {@props.loggedIn && <li><a>Add feature</a></li>}
          </ul>
          <FeaturesForm loggedIn={@props.loggedIn} />
          <FeaturesList loggedIn={@props.loggedIn} />
        </div>
      )

  module.exports = Component
