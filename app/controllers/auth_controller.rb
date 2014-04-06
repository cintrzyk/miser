class AuthController < ApplicationController
  expose(:auth){ Auth.new params[:email], params[:password] }

  def signin
    response = auth.signin
    if response.success?
      render json: session[:signed_user_data] = user(response), status: :created
    else
      render json: {
        msg: { text: 'Wrong email or password. Please check your credentials.', type: 'error' }
      }, status: :unauthorized
    end
  end

  def signout
    session[:signed_user_data] = nil
    redirect_to root_path
  end

  private

  def user(response)
    response.parsed_response.dup.keep_if do |k|
      %w( id auth_token ).include? k
    end
  end
end
