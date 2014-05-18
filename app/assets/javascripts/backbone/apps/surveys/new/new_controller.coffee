@Miser.module 'SurveysApp.New', (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Authenticated

    initialize: ->
      survey = App.request 'new:survey:entity'
      @listenTo survey, 'created', ->
        App.vent.trigger 'survey:created', survey

      @layout = @getLayoutView()
      @listenTo @layout, 'show', ->
        @formRegion survey
        @progressRegion()
      @show @layout

    getLayoutView: ->
      new New.Layout

    getFormView: (survey) ->
      new New.Form
        model: survey

    getProgressView: ->
      new New.Progress

    formRegion: (survey) ->
      view = @getFormView survey
      form_view = App.request 'form:component', view
      @show form_view,
        region: @layout.formRegion

    progressRegion: ->
      view = @getProgressView()
      @show view,
        region: @layout.progressRegion
