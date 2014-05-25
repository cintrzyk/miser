@Miser.module 'SurveysApp', (SurveysApp, App, Backbone, Marionette, $, _) ->

  class SurveysApp.Router extends Marionette.AppRouter
    appRoutes:
      'surveys'          : 'list'
      'surveys/new'      : '_new'
      'surveys/:id/edit' : 'edit'

  API =
    list: ->
      new SurveysApp.List.Controller

    _new: ->
      new SurveysApp.New.Controller

    edit: (id, survey) ->
      survey ||= App.request 'survey:entity', id
      new SurveysApp.Edit.Controller
        survey: survey

  App.addInitializer ->
    new SurveysApp.Router
      controller: API

  App.vent.on 'survey:created', (survey) ->
    App.navigate "surveys/#{survey.id}/edit"
    App.execute 'reload:sidebar'
    API.edit null, survey
