class Auth < Struct.new(:email, :password)
  include HTTParty
  include Rails.application.routes.url_helpers

  base_uri Rails.application.secrets.api_endpoint
  format :json

  def signin
    self.class.post api_signin_path, auth_params
  end

  def self.confirm(token)
    url = Rails.application.routes.url_helpers.api_confirmation_path
    get url, { body: { confirmation_token: token } }
  end

  private

  def auth_params
    {
      body: {
        email: email,
        password: password
      }
    }
  end
end
