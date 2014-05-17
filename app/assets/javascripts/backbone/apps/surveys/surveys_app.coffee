@Miser.module 'SurveysApp', (SurveysApp, App, Backbone, Marionette, $, _) ->

  class SurveysApp.Router extends Marionette.AppRouter
    appRoutes:
      'surveys'     : 'show'
      'surveys/new' : 'new'

  API =
    show: ->
      new SurveysApp.Show.Controller

    new: ->
      new SurveysApp.New.Controller

  App.addInitializer ->
    new SurveysApp.Router
      controller: API
