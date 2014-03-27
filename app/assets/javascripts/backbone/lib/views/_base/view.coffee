@Miser.module 'Views', (Views, App, Backbone, Marionette, $, _) ->

  _.extend Marionette.View::,

    templateHelpers: ->
      currentUser:
        App.request('get:current_user')?.toJSON()
