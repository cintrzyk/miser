@Miser.module 'LandingHeaderApp', (LandingHeaderApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    show: ->
      new LandingHeaderApp.Show.Controller
        region: App.headerRegion

  @onStart = ->
    API.show()
