@Miser.module 'SurveysApp.Edit', (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Authenticated

    initialize: (opt) ->
      { survey } = opt

      @layout = @getLayoutView()

      @listenTo @layout, 'show', ->
        @surveyRegion survey
        @newQuestionRegion()
        @questionsRegion()

      @show @layout

    getLayoutView: ->
      new Edit.Layout

    getSurveyView: (survey) ->
      new Edit.Survey
        model: survey

    getNewQuestionView: ->
      new Edit.NewQuestion

    getQuestionsView: ->
      new Edit.Questions

    surveyRegion: (survey) ->
      view = @getSurveyView survey
      form_view = App.request 'form:component', view
      @show form_view,
        region: @layout.surveyRegion
        loading: true

    newQuestionRegion: ->
      view = @getNewQuestionView()
      @show view, region: @layout.newQuestionRegion

    questionsRegion: ->
      view = @getQuestionsView()
      @show view, region: @layout.questionsRegion
