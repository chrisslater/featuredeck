React = require('react')


NavLink = require('flux-router-component').NavLink
FeaturesList = require('./FeaturesList')
FeaturesForm = require('./FeaturesForm')

Component = React.createClass

  getDefaultProps: (props) ->
    loggedIn: false
    start: 'list'

  render: () ->

    output = '';

    switch @props.start

      when 'list'
        output = <FeaturesList loggedIn={@props.loggedIn} />

      when 'form'
        output = <FeaturesForm loggedIn={@props.loggedIn} />

    (
      <div>
        <ul className="nav nav-tabs">
          <li className="#{'active' if @props.start is 'list'}"><NavLink routeName='features'>All features</NavLink></li>
          {<li className="#{'active' if @props.start is 'form'}" ><NavLink routeName='featuresNew'>Add feature</NavLink></li> if @props.loggedIn}
        </ul>
        {output}
      </div>
    )

module.exports = Component
