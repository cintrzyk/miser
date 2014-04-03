@Miser.module 'Views', (Views, App, Backbone, Marionette, $, _) ->

  _.extend Marionette.View::,

    addOpacityWrapper: (init = true) ->
      @$el.toggleWrapper
        className: 'opacity'
      , init

    templateHelpers: ->
      currentUser:
        App.request('get:current_user')?.toJSON()
