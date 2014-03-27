@Miser.module 'SigninApp', (SigninApp, App, Backbone, Marionette, $, _) ->

  class SigninApp.Router extends Marionette.AppRouter
    appRoutes:
      'signin' : 'show'

  API =
    show: ->
      new SigninApp.Show.Controller

  App.addInitializer ->
    new SigninApp.Router
      controller: API

  App.vent.on 'signin:clicked', ->
    App.navigate 'signin'
    API.show()
