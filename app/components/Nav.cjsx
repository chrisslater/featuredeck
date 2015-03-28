React = require('react')
NavLink = require('flux-router-component').NavLink

Login = require('./user/Login')

Component = React.createClass

  getDefaultProps: () ->
    selected: 'home'
    links: {}

  mapLinks: (links) ->
    Object.keys(links).map (name) ->
      link = links[name]

      if link.label
        return <li><NavLink className="navbar-link" routeName={link.page}>{link.label}</NavLink></li>

  render: () ->
    selected = @props.selected
    links = @props.links
    context = @props.context
    linkHtml = @mapLinks links

    (
      <nav className="navbar navbar-default navbar-inverse">
        <div className="container-fluid">
          <div className="navbar-header">
            <a className="navbar-brand">Featuredeck</a>
          </div>
          <ul className="nav navbar-nav">
            {linkHtml}
          </ul>
          <Login />
        </div>
      </nav>
    )

module.exports = Component
