describe 'App', ->

  describe 'user signed in', ->
    request = undefined
    user =
      id: '1'
      auth_token: 'x21dsa324rf'
      email: 'user@miser.com'
      name: 'John Snow'

    start_app
      user: user

    beforeEach ->
      request = jasmine.Ajax.requests.mostRecent()

    it 'should send user show request', ->
      expect(request.url).toBe apir 'user', id: user.id
      expect(request.method).toBe 'GET'
      expect(request.requestHeaders.Authorization).toBe "Token miser=#{user.auth_token}"

    it 'should set current_user', ->
      expect(App.current_user.attributes).toEqual _.omit(user, 'auth_token')
