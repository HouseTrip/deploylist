module ApplicationHelper
  def github_diff_link(deploy, previous_deploy)
    return unless deploy && previous_deploy
    link_to "See the Full Diff",
      ("https://github.com/HouseTrip/HouseTrip-Web-App/compare/" +
      previous_deploy.short_ref + "..." + deploy.short_ref)
  end

  # https://www.pivotaltracker.com/story/show/76291634
  def pivotal_link(story)
    return unless story.pivotal_uid
    link_to "story",
      "https://www.pivotaltracker.com/story/show/#{story.pivotal_uid}",
      title: "##{story.pivotal_uid}"
  end

  def pull_request_link(story)
    link_to story.title,
      "https://github.com/HouseTrip/HouseTrip-Web-App/pull/#{story.pull_request_uid}",
      title: " ##{story.pull_request_uid}"
  end
end
