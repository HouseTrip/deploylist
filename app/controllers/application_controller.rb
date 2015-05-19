class ApplicationController < ActionController::Base
  force_ssl if: :ssl_configured?

  def new_session_path(scope)
    new_user_session_path
  end

  private

  def ssl_configured?
    Rails.env.production?
  end
end
