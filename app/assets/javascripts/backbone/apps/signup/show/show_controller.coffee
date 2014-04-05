@Miser.module 'SignupApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.NotAuthenticated

    initialize: ->
      user_signup = App.request 'user:signup:entities'

      @listenTo user_signup, 'created', =>
        confirm_view = @getConfirmView()
        @show confirm_view

      form_view = App.request 'form:component', @getFormView(user_signup)

      @show form_view

    getFormView: (user_signup) ->
      new Show.Form
        model: user_signup

    getConfirmView: ->
      new Show.Confirm
