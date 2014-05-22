@Miser.module 'HeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Application
    initialize: (options = {}) ->
      layout = @getLayoutView()

      @listenTo layout, 'user:signout', ->
        window.location = '/signout'

      @listenTo layout, 'menu:button:clicked', ->
        App.execute 'toggle:sidebar'

      @show layout

    getLayoutView: ->
      new Show.Layout
