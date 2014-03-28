@Miser.module 'App', (MainRouter, App, Backbone, Marionette, $, _) ->
  class App.MainRouter extends Marionette.AppRouter
    appRoutes:
      '' : 'checkSignedStatus'

  API =
    checkSignedStatus: ->
      if App.request 'get:current_user'
        console.log 'signed in!'
      else
        App.execute 'show:landing'

  App.addInitializer ->
    new App.MainRouter
      controller: API
