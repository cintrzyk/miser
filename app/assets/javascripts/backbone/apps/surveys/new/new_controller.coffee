@Miser.module 'SurveysApp.New', (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Authenticated

    initialize: ->
      @layout = @getLayoutView()
      @listenTo @layout, 'show', ->
        @formRegion()
        @progressRegion()
      @show @layout

    getLayoutView: ->
      new New.Layout

    getFormView: ->
      new New.Form

    getProgressView: ->
      new New.Progress

    formRegion: ->
      view = @getFormView()
      @show view,
        region: @layout.formRegion

    progressRegion: ->
      view = @getProgressView()
      @show view,
        region: @layout.progressRegion
