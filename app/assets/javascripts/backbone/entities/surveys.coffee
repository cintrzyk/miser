@Miser.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Survey extends Entities.Model
    urlRoot: ->
      Routes.surveys_path()

  API =
    getSurvey: ->
      new Entities.Survey

  App.reqres.setHandler 'new:survey:entity', ->
    API.getSurvey()
