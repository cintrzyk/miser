@Miser = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.on 'initialize:before', (options) ->
    { signed_user_data, api_endpoint, environment, domain } = options
    App.environment = environment
    App.api_endpoint = api_endpoint
    App.domain = domain

    if signed_user_data?
      App.execute 'set:current_user', signed_user_data

  App.rootRoute = '#'

  App.addRegions
    headerRegion: '#header-region'
    mainRegion:   '#main-region'
    footerRegion: '#footer-region'

  App.reqres.setHandler 'default:region', ->
    App.mainRegion

  App.commands.setHandler 'register:instance', (instance, id) ->
    App.register instance, id if App.environment is 'development'

  App.commands.setHandler 'unregister:instance', (instance, id) ->
    App.unregister instance, id if App.environment is 'development'

  App.reqres.setHandler 'get:api_endpoint', ->
    App.api_endpoint

  App.reqres.setHandler 'get:domain', ->
    App.domain

  App.addInitializer ->
    header = if App.request('get:current_user') then 'HeaderApp' else 'LandingHeaderApp'
    App.module(header).start()
    App.module('FooterApp').start()

  App.on 'initialize:after', (options) ->
    @startHistory()
    @navigate @rootRoute, trigger: true unless @getCurrentRoute()

  App
