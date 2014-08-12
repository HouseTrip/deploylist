module ApplicationHelper
  def github_diff_link(deploy, previous_deploy)
    if previous_deploy.present?
    "https://github.com/HouseTrip/HouseTrip-Web-App/compare/" +
      previous_deploy.short_ref +
      "..." +
      deploy.short_ref
    else
      "#"
    end
  end

  def github_username(username)
    GITHUB_USERNAME_MAPPING.fetch(username.to_sym, 'nyancat')
  end
end
