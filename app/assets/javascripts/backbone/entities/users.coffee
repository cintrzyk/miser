@Miser.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.UserSignIn extends Entities.Model
    urlRoot: ->
      App.selfRoute Routes.signin_path()

  class Entities.UserSignUp extends Entities.Model
    urlRoot: ->
      Routes.api_signup_path()

  class Entities.User extends Entities.Model
    urlRoot: ->
      Routes.users_path()

  class Entities.Users extends Backbone.Collection
    model: Entities.User
    url: 'users'


  API =
    getUsers: ->
      new Entities.Users

    getUser: (user_id, options = {}) ->
      user = new Entities.User
        id: user_id
      user.fetch options
      user

    getUserSignUp: ->
      new Entities.UserSignUp

    getUserSignIn: ->
      new Entities.UserSignIn

  App.reqres.setHandler 'users:entities', ->
    API.getUsers()

  App.reqres.setHandler 'user:entities', (user_id, options) ->
    API.getUser user_id, options

  App.reqres.setHandler 'user:signup:entities', ->
    API.getUserSignUp()

  App.reqres.setHandler 'user:signin:entities', ->
    API.getUserSignIn()
