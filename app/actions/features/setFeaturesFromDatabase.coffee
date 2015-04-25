module.exports = (context, payload, done) ->

  context.service.read 'features', {}, {}, (err, features) ->

    context.dispatch 'SET_FEATURES', features
    done()
