module.exports = (context, payload, done) ->
  console.log context
  context.service.read 'item', {}, {}, (err, userInfo) ->

    console.log(context, payload)

    if err || !userInfo
      context.dispatch('RECEIVE_USER_INFO_FAILURE', err)
    else
      context.dispatch('RECEIVE_USER_INFO_SUCCESS', userInfo)

    done()
