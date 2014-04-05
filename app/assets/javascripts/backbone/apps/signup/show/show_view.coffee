@Miser.module 'SignupApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Form extends App.Views.ItemView
    template: 'signup/show/form'
    className: 'panel panel-default'

    form:
      className: 'form-horizontal'
      focusFirstInput: true

  class Show.Confirm extends App.Views.ItemView
    template: 'signup/show/confirm'
