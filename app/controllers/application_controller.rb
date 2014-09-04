class ApplicationController < ActionController::Base

  private

  def authenticate
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV.fetch('USERNAME') && password == ENV.fetch('PASSWORD')
    end
  end

end
