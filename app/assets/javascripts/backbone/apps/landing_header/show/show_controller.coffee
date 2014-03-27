@Miser.module 'LandingHeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base
    initialize: (options = {}) ->
      @layout = @getLayoutView()

      @listenTo @layout, 'show', =>
        @signinRegion()

      @show @layout

    getLayoutView: ->
      new Show.Layout

    getSigninView: ->
      new Show.SigninForm

    signinRegion: ->
      view = @getSigninView()

      @show view,
        region: @layout.signinRegion
