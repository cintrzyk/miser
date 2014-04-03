@Miser.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

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

  App.reqres.setHandler 'users:entities', ->
    API.getUsers()

  App.reqres.setHandler 'user:entities', (user_id, options) ->
    API.getUser user_id, options

  App.reqres.setHandler 'user:signup:entities', ->
    API.getUserSignUp()
