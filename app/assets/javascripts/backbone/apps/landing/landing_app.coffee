@Miser.module 'LandingApp', (LandingApp, App, Backbone, Marionette, $, _) ->

  API =
    show: ->
      new LandingApp.Show.Controller

  App.commands.setHandler 'user:notauthenticated', ->
    App.navigate App.rootRoute
    API.show()
