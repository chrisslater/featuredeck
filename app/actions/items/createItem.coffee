module.exports = (context, payload, done) ->
  console.log('in action', arguments);
  context.service.create 'items', payload, payload, (err, item) ->
    context.dispatch('ADD_ITEM', item);
    done()
