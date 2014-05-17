@Miser.module 'SidebarApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Authenticated

    initialize: (opt) ->
      { activeLink } = opt
      layout = @getLayoutView activeLink
      @show layout

    getLayoutView: (activeLink) ->
      new Show.Layout
        activeLink: activeLink
