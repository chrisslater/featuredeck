React = require('react')


NavLink = require('flux-router-component').NavLink
FeaturesList = require('./FeaturesList')
FeaturesForm = require('./FeaturesForm')

Component = React.createClass
  displayName: 'Features'

  getDefaultProps: () ->
    start: 'list'

  render: () ->
    output = '';

    switch @props.start
      when 'list'
        output = <FeaturesList isLoggedIn={@props.isLoggedIn} isAdmin={@props.isAdmin} features={@props.features}/>
      when 'form'
        output = <FeaturesForm isLoggedIn={@props.isLoggedIn} isAdmin={@props.isAdmin} />

    (
      <div>
        <ul className="nav nav-tabs">
          <li className="#{'active' if @props.start is 'list'}"><NavLink routeName='features'>All features</NavLink></li>
          {<li className="#{'active' if @props.start is 'form'}" ><NavLink routeName='featuresNew'>Add feature</NavLink></li> if @props.isLoggedIn}
        </ul>
        {output}
      </div>
    )

module.exports = Component
