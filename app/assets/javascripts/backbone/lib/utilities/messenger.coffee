@Miser.module 'Utilities', (Utilities, App, Backbone, Marionette, $, _) ->

  Messenger.options = {
    extraClasses: 'messenger-fixed messenger-on-top messenger-on-right'
    theme: 'air'
    parentLocations: ['#main-region']
  }

  _.extend App,

    msg: (text, options = {}) ->
      _.defaults options,
        showCloseButton: true
        type: 'success'

      { type, showCloseButton } = options

      Messenger().post
        message: text
        type: type
        showCloseButton: showCloseButton
        hideAfter: 7
