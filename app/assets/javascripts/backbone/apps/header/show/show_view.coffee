@Miser.module 'HeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: 'header/show/templates/layout'
    triggers:
      'click [data-signout]' : 'user:signout'
