@App = Miser

@apir = (name, opt = {}) ->
  route_path = Routes[name + '_path'](opt)
  "http://#{App.api_endpoint}" + route_path

@start_app = (opt = {}) ->
  { beforeStart, config, user } = opt

  _.defaults user ||= {},
    auth_token: 'token'
    id: '1'

  _.defaults config ||= {},
    environment: 'test'
    signed_user_data:
      auth_token: user.auth_token
      id: user.id
    api_endpoint: 'api.test'
    domain: 'miser.test'

  beforeEach ->
    jasmine.Ajax.install()
    jasmine.Ajax
      .stubRequest apir('user', id: user.id)
      .andReturn UsersResponses.show.success(_.pick(user, 'name', 'email', 'id'))

    beforeStart?()
    App.start config

  afterEach ->
    jasmine.Ajax.uninstall()
    Backbone.history.stop()
