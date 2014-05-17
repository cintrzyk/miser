@Miser.module 'SidebarApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template:  'sidebar/show/layout'
    tagName:   'ul'
    className: 'nav main-menu'

    initialize: (opt) ->
      { @activeLink } = opt

    onRender: ->
      @makeActiveLink()

    makeActiveLink: ->
      @$("a[href='##{@activeLink}']").addClass 'active'
