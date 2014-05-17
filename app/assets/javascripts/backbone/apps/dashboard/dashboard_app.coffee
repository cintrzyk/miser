@Miser.module 'DashboardApp', (DashboardApp, App, Backbone, Marionette, $, _) ->

  class DashboardApp.Router extends Marionette.AppRouter
    # appRoutes:
      # '' : 'show'

  API =
    show: ->
      App.execute 'show:sidebar'
      new DashboardApp.Show.Controller

  App.addInitializer ->
    new DashboardApp.Router
      controller: API

  App.commands.setHandler 'show:dashboard', ->
    API.show()
