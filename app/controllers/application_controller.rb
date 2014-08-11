class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate, if: -> { Rails.env.production? }

  private

  def authenticate
    http_basic_authenticate_with name: ENV.fetch('USERNAME'), password: ENV.fetch('PASSWORD')
  end

end
