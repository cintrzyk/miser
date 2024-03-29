@Miser.module 'DashboardApp', (DashboardApp, App, Backbone, Marionette, $, _) ->

  class DashboardApp.Router extends Marionette.AppRouter
    appRoutes:
      'dashboard' : 'show'

  API =
    show: ->
      new DashboardApp.Show.Controller

  App.addInitializer ->
    new DashboardApp.Router
      controller: API

  App.commands.setHandler 'show:dashboard', ->
    App.navigate 'dashboard'
    API.show()
