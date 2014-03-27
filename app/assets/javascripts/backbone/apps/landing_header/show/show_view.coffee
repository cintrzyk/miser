@Miser.module 'LandingHeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: 'landing_header/show/templates/layout'
    regions:
      signinRegion: '#signin-region'

  class Show.SigninForm extends App.Views.ItemView
    template: 'landing_header/show/templates/signinform'
    tagName: 'signin-form'
    events:
      'submit form' : 'onSubmit'

    onSubmit: (e) ->
      e.preventDefault()
      { email, password } = Backbone.Syphon.serialize @
      App.signin email, password
