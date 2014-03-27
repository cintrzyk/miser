@Miser.module 'Utilities', (Utilities, App, Backbone, Marionette, $, _) ->

  _.extend App,

    navigate: (route, options = {}) ->
      Backbone.history.navigate route, options

    getCurrentRoute: ->
      frag = Backbone.history.fragment
      if _.isEmpty frag then null else frag

    startHistory: ->
      Backbone.history.start()

    domainRoute: (route) ->
      domain = App.request 'get:domain'
      "http://#{domain}#{route}"

