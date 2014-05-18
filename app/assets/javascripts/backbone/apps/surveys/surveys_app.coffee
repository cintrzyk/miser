@Miser.module 'SurveysApp', (SurveysApp, App, Backbone, Marionette, $, _) ->

  class SurveysApp.Router extends Marionette.AppRouter
    appRoutes:
      'surveys'     : 'list'
      'surveys/new' : 'new'

  API =
    list: ->
      new SurveysApp.List.Controller

    new: ->
      new SurveysApp.New.Controller

  App.addInitializer ->
    new SurveysApp.Router
      controller: API

  App.vent.on 'survey:created', (survey) ->
    App.navigate 'surveys'
    App.execute 'reload:sidebar'
    API.list()
