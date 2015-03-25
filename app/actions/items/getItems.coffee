module.exports = (context, payload, done) ->
  context.service.read 'items', {}, {}, (err, items) ->
    context.dispatch('GET_ITEMS', items);
    done()
