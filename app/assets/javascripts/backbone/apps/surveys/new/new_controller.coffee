@Miser.module 'SurveysApp.New', (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Authenticated

    initialize: ->
      layout = @getLayoutView()
      @show layout

    getLayoutView: ->
      new New.Layout
