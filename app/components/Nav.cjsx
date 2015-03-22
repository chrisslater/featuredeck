React = require('react')
NavLink = require('flux-router-component').NavLink

Component = React.createClass

  getDefaultProps: () ->
    selected: 'home'
    links: {}

  mapLinks: (links) ->
    Object.keys(links).map (name) ->
      link = links[name]

      if link.label
        return <NavLink routeName={link.page}>{link.label}</NavLink>

  render: () ->
    selected = @props.selected
    links = @props.links
    context = @props.context
    linkHtml = @mapLinks links

    (
      <nav>
        {linkHtml}
      </nav>
    )

module.exports = Component
