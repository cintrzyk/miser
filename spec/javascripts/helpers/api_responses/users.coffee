@UsersResponses =
  show:
    success: (user = {}) ->
      _.defaults user,
        id: '1'
        email: 'cintrzyk@gmail.com'
        name: 'Black Jack'

      status: 200
      responseText: JSON.stringify user
