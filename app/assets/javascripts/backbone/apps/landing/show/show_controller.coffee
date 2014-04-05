@Miser.module 'LandingApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.NotAuthenticated

    initialize: ->
      user_signup = App.request 'user:signup:entities'

      @listenTo user_signup, 'created', =>
        confirm_view = @getConfirmView()

        @show confirm_view,
          region: @layout.signupRegion

      @layout = @getLayoutView()

      @listenTo @layout, 'show', =>
        @signupRegion user_signup

      @show @layout

    getLayoutView: ->
      new Show.Layout

    getSignupView: (user_signup) ->
      new Show.Signup
        model: user_signup

    getConfirmView: ->
      new Show.SignupConfirm

    signupRegion: (user_signup) ->
      signup_view = @getSignupView user_signup
      form_view = App.request 'form:component', signup_view

      @show form_view,
        region: @layout.signupRegion
