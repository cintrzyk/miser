@Miser.module 'LandingApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: 'landing/show/templates/layout'
    regions:
      signupRegion : '.signup-region'

  class Show.Signup extends App.Views.ItemView
    template: 'landing/show/templates/signup'
    className: 'panel panel-default'

    form:
      className: 'form-horizontal'
      focusFirstInput: true

  class Show.SignupConfirm extends App.Views.ItemView
    template: 'landing/show/templates/confirm'
