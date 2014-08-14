class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate, if: -> { Rails.env.production? }

  private

  def authenticate
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV.fetch('USERNAME') && password == ENV.fetch('PASSWORD')
    end
  end

end
