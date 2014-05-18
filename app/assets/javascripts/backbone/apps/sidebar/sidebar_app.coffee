@Miser.module 'SidebarApp', (SidebarApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    show: ->
      new SidebarApp.Show.Controller
        region: App.sidebarRegion

  @onStart = ->
    API.show()

  App.commands.setHandler 'toggle:sidebar', ->
    $('#main').toggleClass 'sidebar-show'

  App.commands.setHandler 'reload:sidebar', ->
    API.show()
