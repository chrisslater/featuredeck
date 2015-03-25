module.exports = (context, payload, done) ->
  context.service.create 'items', {}, payload, (err, item) ->
    context.dispatch('ADD_ITEM', item);
    done()
