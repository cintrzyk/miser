@Miser.module 'LandingApp', (LandingApp, App, Backbone, Marionette, $, _) ->

  API =
    show: ->
      new LandingApp.Show.Controller
        region: App.mainRegion

  App.commands.setHandler 'show:landing', ->
    API.show()
