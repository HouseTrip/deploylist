class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    if domain_user?
      sign_in_and_redirect(User.find_for_google_oauth2(request.env["omniauth.auth"], current_user), event: :authentication)
    else
      redirect_to access_denied_path
    end
  end

  private

  def domain_user?
    request.env['omniauth.auth']['extra']['raw_info']['hd'] == ENV['GOOGLE_DOMAIN']
  end
end
