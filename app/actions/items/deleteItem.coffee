module.exports = (context, payload, done) ->
  context.service.create 'items', {}, payload, (err, item) ->
    context.dispatch('REMOVE_ITEM', item);
    done()
