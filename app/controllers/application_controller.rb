class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    gon.environment = Rails.env
    gon.api_endpoint = Rails.application.secrets.api_endpoint
    gon.domain = Rails.application.secrets.domain

    if signed_user_data.present?
      gon.signed_user_data = signed_user_data
      render
    else
      render layout: 'landing'
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def signed_user_data
    session[:signed_user_data]
  end
end
