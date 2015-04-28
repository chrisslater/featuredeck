# Actions
addAlertAction = require '../actions/alerts/addAlert'
removeAlertAction = require '../actions/alerts/removeAlert'

module.exports = (options) ->

  return {
    name: 'AlertPlugin',

    plugContext: (options) ->

      {
        # Method called to allow modification of the component context
        # plugComponentContext: function (componentContext) {
        #     componentContext.getFoo = function () {
        #         return foo;
        #     };
        # },

        plugActionContext: (context) ->
          alert = context.alert = {}

          alert.add = (payload) ->
            context.executeAction addAlertAction, payload

          alert.remove = () ->
            context.executeAction removeAlertAction

        #plugStoreContext: function (storeContext) {}

        # Allows context plugin settings to be persisted between server and client. Called on server
        # to send data down to the client
        dehydrate: () ->


        # Called on client to rehydrate the context plugin settings
        rehydrate: (state) ->

      }

    # Allows dehydration of application plugin settings
    dehydrate: () ->
      {}
    # Allows rehydration of application plugin settings
    rehydrate: (state) ->
  }
