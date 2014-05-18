@Miser.module 'SidebarApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Authenticated

    initialize: ->
      layout = @getLayoutView()
      @show layout

    getLayoutView: ->
      new Show.Layout
