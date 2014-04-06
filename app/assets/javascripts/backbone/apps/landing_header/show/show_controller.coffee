@Miser.module 'LandingHeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base
    initialize: (options = {}) ->
      user_signin = App.request 'user:signin:entities'

      @listenTo user_signin, 'created', ->
        window.location = '/'

      @layout = @getLayoutView()

      @listenTo @layout, 'show', =>
        @signinRegion user_signin

      @show @layout

    getLayoutView: ->
      new Show.Layout

    getSigninView: (user_signin) ->
      new Show.SigninForm
        model: user_signin

    signinRegion: (user_signin) ->
      signin_view = @getSigninView user_signin
      form_view = App.request 'form:component', signin_view

      @show form_view,
        region: @layout.signinRegion
