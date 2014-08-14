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
end
