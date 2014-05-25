@Miser.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Survey extends Entities.Model
    urlRoot: ->
      Routes.surveys_path()

  class Entities.Surveys extends Entities.Collection
    model: Entities.Survey
    url: ->
      Routes.surveys_path()

  API =
    getNewSurvey: ->
      new Entities.Survey

    getSurvey: (id) ->
      survey = new Entities.Survey
        id: id
      survey.fetch()
      survey

    getSurveys: ->
      surveys = new Entities.Surveys
      surveys.fetch()
      surveys

  App.reqres.setHandler 'new:survey:entity', ->
    API.getNewSurvey()

  App.reqres.setHandler 'survey:entity', (id) ->
    API.getSurvey id

  App.reqres.setHandler 'surveys:entities', ->
    API.getSurveys()
