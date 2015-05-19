class SessionsController < Devise::SessionsController
  def new
    redirect_to user_omniauth_authorize_path(:google_oauth2)
  end
end
