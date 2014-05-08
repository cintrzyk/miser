@Miser.module 'SidebarApp', (SidebarApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    show: ->
      new SidebarApp.Show.Controller
        region: App.sidebarRegion

  @onStart = ->
    API.show()
