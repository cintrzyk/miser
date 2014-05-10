@Miser.module 'HeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: 'header/show/layout'
    triggers:
      'click [data-signout]' : 'user:signout'
      'click .show-sidebar'  : 'menu:button:clicked'
