@Miser.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Survey extends Entities.Model
    urlRoot: ->
      Routes.surveys_path()

  class Entities.Surveys extends Entities.Collection
    model: Entities.Survey
    url: ->
      Routes.surveys_path()

  API =
    getSurvey: ->
      new Entities.Survey

    getSurveys: ->
      surveys = new Entities.Surveys
      surveys.fetch()
      surveys

  App.reqres.setHandler 'new:survey:entity', ->
    API.getSurvey()

  App.reqres.setHandler 'surveys:entities', ->
    API.getSurveys()
