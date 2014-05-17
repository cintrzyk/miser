@Miser.module 'SurveysApp', (SurveysApp, App, Backbone, Marionette, $, _) ->

  class SurveysApp.Router extends Marionette.AppRouter
    appRoutes:
      'surveys' : 'show'

  API =
    show: ->
      App.execute 'show:sidebar', 'surveys'
      new SurveysApp.Show.Controller

  App.addInitializer ->
    new SurveysApp.Router
      controller: API

  App.commands.setHandler 'show:surveys', ->
    App.navigate 'surveys'
    API.show()
