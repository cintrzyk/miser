@Miser.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.User extends Backbone.Model
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

  App.reqres.setHandler 'users:entities', ->
    API.getUsers()

  App.reqres.setHandler 'user:entities', (user_id, options) ->
    API.getUser user_id, options
