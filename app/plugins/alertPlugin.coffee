module.exports = (options) ->
  options = options || {}
  foo = options.foo

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
          context.getFoo = () ->
            foo

        #plugStoreContext: function (storeContext) {}

        # Allows context plugin settings to be persisted between server and client. Called on server
        # to send data down to the client
        dehydrate: () ->
          foo: foo

        # Called on client to rehydrate the context plugin settings
        rehydrate: (state) ->
          foo = state.foo
      }

    # Allows dehydration of application plugin settings
    dehydrate: () ->
      {}
    # Allows rehydration of application plugin settings
    rehydrate: (state) ->
  }
