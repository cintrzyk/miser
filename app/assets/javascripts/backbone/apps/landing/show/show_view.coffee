@Miser.module 'LandingApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: 'landing/show/layout'
    regions:
      signupRegion : '.signup-region'
