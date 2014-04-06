@Miser.module 'HeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base
    initialize: (options = {}) ->
      layout = @getLayoutView()

      @listenTo layout, 'user:signout', ->
        window.location = '/signout'

      @show layout

    getLayoutView: ->
      new Show.Layout
