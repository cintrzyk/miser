@Miser = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.on 'initialize:before', (options) ->
    { signed_user_data, api_endpoint, environment, domain } = options
    App.environment = environment
    App.api_endpoint = api_endpoint
    App.domain = domain

    if signed_user_data?
      $.ajaxSetup
        headers:
          'Authorization': "Token miser=#{signed_user_data.auth_token}"
      user = App.request 'user:entities', signed_user_data.id,
        async: false
      App.current_user = user

  App.rootRoute = '#'

  App.addRegions
    headerRegion:  '#header-region'
    sidebarRegion: '#sidebar-region'
    mainRegion:    '#main-region'
    footerRegion:  '#footer-region'

  App.reqres.setHandler 'default:region', ->
    App.mainRegion

  App.reqres.setHandler 'get:api_endpoint', ->
    App.api_endpoint

  App.reqres.setHandler 'get:domain', ->
    App.domain

  App.reqres.setHandler 'get:current_user', ->
    App.current_user

  App.commands.setHandler 'register:instance', (instance, id) ->
    App.register instance, id if App.environment is 'development'

  App.commands.setHandler 'unregister:instance', (instance, id) ->
    App.unregister instance, id if App.environment is 'development'

  App.addInitializer ->
    if App.request 'get:current_user'
      header = 'HeaderApp'
      App.module('SidebarApp').start()
    else
      header = 'LandingHeaderApp'
    App.module(header).start()
    App.module('FooterApp').start()

  App.on 'initialize:after', (options) ->
    @startHistory()
    @navigate @rootRoute, trigger: true unless @getCurrentRoute()

  App
