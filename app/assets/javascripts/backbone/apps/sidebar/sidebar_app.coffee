@Miser.module 'SidebarApp', (SidebarApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    show: (activeLink) ->
      new SidebarApp.Show.Controller
        region: App.sidebarRegion
        activeLink: activeLink

  @onStart = ->
    API.show()

  App.commands.setHandler 'toggle:sidebar', ->
    $('#main').toggleClass 'sidebar-show'
