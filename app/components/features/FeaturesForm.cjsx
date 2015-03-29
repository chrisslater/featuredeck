React = require('react')

# Mixins
FluxibleMixin = require('fluxible').FluxibleMixin

# Actions
submitNewFeature = require('../../actions/features/submitNewFeature')

Component = React.createClass
  mixins: [FluxibleMixin]

  getDefaultProps: () ->
    loggedIn: false

  onChangeTitle: (e) ->
    @setState
      title: e.target.value

  onFormSubmit: (e) ->
    e.preventDefault()
    @executeAction submitNewFeature, @state
    @refs.form.getDOMNode().reset()

  render: () ->

    (
      <form onSubmit={@onFormSubmit} ref="form">
        <div class="form-group">
          <label for="title">Title</label>
          <input type="text" class="form-control" id="title" placeholder="Enter title" onChange={@onChangeTitle} />
        </div>

        <button type="submit" class="btn btn-default">Add feature request</button>
      </form>
    )

module.exports = Component
