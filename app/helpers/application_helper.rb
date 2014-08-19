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

  # https://www.pivotaltracker.com/story/show/76291634
  def pivotal_link(story)
    return unless story.pivotal_uid
    link_to "Pivotal story ##{story.pivotal_uid}",
      "https://www.pivotaltracker.com/story/show/#{story.pivotal_uid}"
  end

  # https://www.pivotaltracker.com/story/show/76291634
  def pull_request_link(story)
    return unless story.pull_request_uid
    link_to "Pull request ##{story.pull_request_uid}",
      "https://github.com/HouseTrip/HouseTrip-Web-App/pull/#{story.pull_request_uid}"
  end
end
