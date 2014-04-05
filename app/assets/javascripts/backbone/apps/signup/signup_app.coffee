@Miser.module 'SignupApp', (SignupApp, App, Backbone, Marionette, $, _) ->

  API =
    show: (region) ->
      new SignupApp.Show.Controller
        region: region

  App.commands.setHandler 'show:signup', (region) ->
    API.show region
