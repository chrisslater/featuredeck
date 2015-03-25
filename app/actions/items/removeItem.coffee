module.exports = (context, payload, done) ->
  context.service.delete 'items', payload, payload, (err, item) ->
    context.dispatch('REMOVE_ITEM', item)
    done()
