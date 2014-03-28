@Miser.module 'LandingApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.NotAuthenticated

    initialize: ->
      @layout = @getLayoutView()

      @listenTo @layout, 'show', =>
        @signupRegion()

      @show @layout

    getLayoutView: ->
      new Show.Layout

    getSignupView: ->
      new Show.Signup

    signupRegion: ->
      view = @getSignupView()
      @show view,
        region: @layout.signupRegion
