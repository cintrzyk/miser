@Miser.module 'LandingApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.NotAuthenticated

    initialize: ->
      layout = @getLayoutView()
      @show layout

    getLayoutView: ->
      new Show.Layout
