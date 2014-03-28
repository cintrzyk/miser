@Miser.module 'Utilities', (Utilities, App, Backbone, Marionette, $, _) ->

  _.extend App,

    signup: (email, password) ->
      console.log 'sign up request'

    signin: (email, password) ->
      Messenger().run
        errorMessage: 'Please check your credentials.'
        successMessage: 'Signin successfully!'
        progressMessage: 'Trying to sing in. Please wait...'
      ,
        url: App.domainRoute(Routes.signin_path())
        type: 'post'
        data:
          email: email
          password: password
        success: ->
          App.execute 'user:signin:success'

    signout: ->
      window.location = '/signout'

  App.reqres.setHandler 'get:current_user', ->
    App.current_user

  App.commands.setHandler 'set:current_user', (data) ->
    App.execute 'set:auth_token', data.auth_token
    user = App.request 'user:entities', data.id,
      async: false
    App.current_user = user

  App.commands.setHandler 'user:signin:success', ->
    window.location = '/'

  App.commands.setHandler 'set:auth_token', (token) ->
    $.ajaxSetup
      headers:
        'Authorization': "Token miser=#{token}"
